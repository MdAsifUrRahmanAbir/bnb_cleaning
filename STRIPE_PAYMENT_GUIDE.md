# Stripe Payment Screen Routing & Dependency Guide

This guide explains the data flow mismatch between the **Cart Checkout** flow and the **Re-Order** flow when navigating to `StripePaymentScreen`, and provides a clean, decoupled solution.

---

## 1. The Issue: Why the Re-Order Flow Crashes

Currently, `StripePaymentScreen` retrieves its items inside `initState` using a hardcoded dependency lookup:
```dart
items = Get.find<ShoppingCartController>()
    .cartIndexModel
    .carts
    .firstWhere((cart) => cart.id.toString() == Get.arguments.toString())
    .items;
```

### The Mismatch:
1. **Cart Flow:** Passes the current `cartId` as `arguments`. `ShoppingCartController` contains this active cart inside `cartIndexModel.carts`, so the lookup succeeds.
2. **Re-Order Flow:** Passes `orderId` (a past order ID) as `arguments`. Since past orders do not exist in the active `ShoppingCartController.cartIndexModel.carts` list, this lookup fails, throwing a `StateError (Bad state: No element)` and causing a **runtime crash**.
3. **Model Mismatch:**
   * Cart items are parsed as `Item` objects (fields: `itemName`, `itemPrice`, `itemQty`).
   * Re-order items are parsed as `Detail` objects (fields: `itemName`, `price`, `qty` as String).

---

## 2. Decoupled Solution: Map-Based Arguments

To make `StripePaymentScreen` reusable and independent, we should pass all required data as a unified `Map<String, dynamic>` through `Get.to()`. This removes the screen's direct dependence on background controller states for finding items.

### Required Information for Payment Screen:
1. **`id`**: Cart ID or Order ID (for tracking/API payload).
2. **`total_price`**: The base cost of the items.
3. **`selected_date`**: The booking date (used to calculate the 20% Sunday/same-day surcharge).
4. **`items`**: A unified key-value list of item details for visual rendering.

---

## 3. Implementation Code

### Step 3.1: Passing Arguments from `CartDetailScreen`
Modify the navigation code in `cart_detail_screen.dart` (near the pay/checkout button):

```dart
Get.to(
  const StripePaymentScreen(),
  arguments: {
    'id': id.toString(),
    'total_price': controller.totalPrice.value,
    'selected_date': shoppingCartController.selectedDateTime.value,
    'items': items.map((item) => {
      'name': item.itemName,
      'qty': item.itemQty,
      'price': item.itemPrice,
    }).toList(),
  },
);
```

### Step 3.2: Passing Arguments from `OrderController` (Re-Order Flow)
Modify the navigation code in `order_controller.dart`:

```dart
Get.to(
  () => const StripePaymentScreen(),
  arguments: {
    'id': orderId,
    'total_price': double.parse(total),
    'selected_date': selectedDate.value!,
    'items': orderDetails.map((detail) => {
      'name': detail.itemName,
      'qty': int.parse(detail.qty),
      'price': double.parse(detail.price),
    }).toList(),
  },
);
```

### Step 3.3: Receiving Arguments in `StripePaymentScreen`
Update `stripe_payment_screen.dart` to read parameters from the argument map instead of searching controllers:

```dart
class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  final controller = Get.put(StripePaymentController());

  late final String paymentId;
  late final double basePrice;
  late final DateTime bookingDate;
  late final List<Map<String, dynamic>> displayItems;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    
    paymentId = args['id'];
    basePrice = args['total_price'];
    bookingDate = args['selected_date'];
    displayItems = List<Map<String, dynamic>>.from(args['items']);
  }
}
```

---

## 4. UI Layout & Controller Call

Inside the `build` method of `StripePaymentScreen`, calculate prices and hook up the Stripe SDK fields:

```dart
@override
Widget build(BuildContext context) {
  // 1. Calculate same-day / Sunday 20% surcharge
  double extra = (checkDate(bookingDate) ? (basePrice * 0.20) : 0.0);
  double totalPrice = basePrice + extra;

  return Scaffold(
    appBar: const PrimaryAppBar(title: "Stripe Payment"),
    body: Form(
      key: controller.formKey,
      child: ListView(
        children: [
          // 2. Display Price Breakdown
          Text("Subtotal: £${basePrice.toStringAsFixed(2)}"),
          if (checkDate(bookingDate)) 
            Text("Surcharge (20%): £${extra.toStringAsFixed(2)}"),
          Text("Grand Total: £${totalPrice.toStringAsFixed(2)}"),

          // 3. Display Items list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayItems.length,
            itemBuilder: (context, index) {
              final item = displayItems[index];
              return ListTile(
                title: Text(item['name']),
                subtitle: Text("Qty: ${item['qty']}"),
                trailing: Text("£${item['price'].toStringAsFixed(2)}"),
              );
            },
          ),

          // 4. Stripe SDK Card Input Field
          CardField(
            onCardChanged: (card) {
              // Handle card changes if needed
            },
          ),

          // 5. Submit Button with controller loader state
          Obx(() => controller.isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    // Triggers the payment method generation and order processing APIs
                    controller.confirm(totalPrice.toStringAsFixed(2));
                  },
                  child: Text("Pay Now"),
                )),
        ],
      ),
    ),
  );
}
```
