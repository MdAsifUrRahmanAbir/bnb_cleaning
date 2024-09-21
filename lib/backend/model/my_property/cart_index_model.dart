class CartIndexModel {
  final bool success;
  final String message;
  final List<CartItem> cartItems;
  final DateData dateData;

  CartIndexModel({
    required this.success,
    required this.message,
    required this.cartItems,
    required this.dateData,
  });

  factory CartIndexModel.fromJson(Map<String, dynamic> json) => CartIndexModel(
    success: json["success"],
    message: json["message"],
    cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
    dateData: DateData.fromJson(json["date_data"]),
  );
}

class CartItem {
  final int id;
  final int cartId;
  final int propertyId;
  final String itemName;
  final double itemPrice;
  final int itemQty;
  final String rowSum;
  final dynamic quantity;
  final String attributes;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartItem({
    required this.id,
    required this.cartId,
    required this.propertyId,
    required this.itemName,
    required this.itemPrice,
    required this.itemQty,
    required this.rowSum,
    required this.quantity,
    required this.attributes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    cartId: json["cart_id"],
    propertyId: json["property_id"],
    itemName: json["item_name"],
    itemPrice: json["item_price"].toDouble(),
    itemQty: json["item_qty"],
    rowSum: json["row_sum"],
    quantity: json["quantity"],
    attributes: json["attributes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}

class DateData {
  final int id;
  final String dateValue;
  final DateTime createdAt;
  final DateTime updatedAt;

  DateData({
    required this.id,
    required this.dateValue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DateData.fromJson(Map<String, dynamic> json) => DateData(
    id: json["id"],
    dateValue: json["date_value"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}