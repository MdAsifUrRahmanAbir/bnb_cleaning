import '../../utils/basic_widget_imports.dart';

class HomeController extends GetxController{
  RxBool showArrow = true.obs;

  List type = [
    {
      "type": "HOW TO MAKE AN ORDER",
      "list": [
        {
          "title": "01.Add Property",
          "subTitle": "To be able to place an order, first you need to add a property and fill in the required details",
        },
        {
          "title": "02.Shopping Cart",
          "subTitle": "Add your property to the shopping cart. From there you can add required products/services",
        },
        {
          "title": "03.Payment",
          "subTitle": "Pay for your products or services securily using Stripe.We don't store your payment card details !",
        },
      ]
    },
    {
      "type": "HOW TO ORDER AIRBNB CLEANING SERVICES",
      "list": [
        {
          "title": "01.Add Property",
          "subTitle": "Add your property listing to the cart and click on shopping cart. Once you are in your shopping cart click on the edit button.",
        },
        {
          "title": "02.Choose Date",
          "subTitle": "Select the date you’d like the service to be performed.Please note that there’s 20% surcharge for bookings made on Sundays.",
        },
        {
          "title": "03.Add Linen hire",
          "subTitle": "After you have selected your property type, you must add linen hire. Please note that Airbnb Cleaning Services can only be booked with Linen hire.",
        },
        {
          "title": "04.Optional Extras",
          "subTitle": "You can add optional extras such as cleaning inside of kitchen appliances or you can add some of the products that we offer for your property.",
        },
        {
          "title": "05.Payment",
          "subTitle": "After you have selected your property type, added linen hire, chosen date and optionally selected products or extras, you can make a payment.",
        },
      ]
    },
    {
      "type": "HOW TO ORDER (ONLY) LINEN HIRE",
      "list": [
        {
          "title": "01.Add Property",
          "subTitle": "Add your property listing to the cart and click on shopping cart. Once you are in your shopping cart click on the edit button.",
        },
        {
          "title": "02.Choose Date",
          "subTitle": "Select the date you’d like the linen to be delivered. Sunday appointments incur 20% surcharge.",
        },
        {
          "title": "03.Add Linen",
          "subTitle": "Choose the linen you’d need.Please note that we have a minimum order value of £40.The minimum order value does not apply when you book Linen hire with Airbnb Cleaning",
        },
        {
          "title": "04.Optional Extras",
          "subTitle": "Should you require, we can supply you with essential products for your property such as bin bags, toiletries, toilet tissue etc. Click on the Products menu and add what you require to your order.",
        },
        {
          "title": "05.Payment ",
          "subTitle": " Great, you have selected your linen hire that exceeds the minimum order value of £40, and now you can make secure payment using Stripe.",
        },
      ]
    },
    {
      "type": "HOW TO ORDER MID STAY SHORT LET CLEAN",
      "list": [
        {
          "title": "01.Add Property",
          "subTitle": "Add your property listing to the cart and click on shopping cart. Once you are in your shopping cart click on the edit button.",
        },
        {
          "title": "02.Choose Date",
          "subTitle": "Select the date you’d like the service to be performed.Please note that there’s 20% surcharge for bookings made on Sundays.",
        },
        {
          "title": "03.Property Type",
          "subTitle": "Select your property type. No minimum order value for this service.",
        },
        {
          "title": "04.Optional Products",
          "subTitle": "Please note that household products are not available to order with this type of service.",
        },
        {
          "title": "05.Payment ",
          "subTitle": "You have selected your property type and chosen date, you can now make a secure payment online.",
        },
      ]
    },
    {
      "type": "HOW TO ORDER PRODUCTS & BUNDLES",
      "list": [
        {
          "title": "",
          "subTitle": "Please note that you can order Products & Bundles only when booked with Airbnb Cleaning and Linen Hire services. Products and Bundles are not available to be ordered on their own and with Mid Stay Short Let Clean. Ordering Products & Bundles is optional and not compulsory for any of the services. ",
        }
      ]
    }
  ];
}