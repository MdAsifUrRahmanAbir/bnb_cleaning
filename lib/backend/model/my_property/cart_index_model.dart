
class CartIndexModel {
  final bool success;
  final String message;
  final List<Cart> carts;
  final DateData dateData;

  CartIndexModel({
    required this.success,
    required this.message,
    required this.carts,
    required this.dateData,
  });

  factory CartIndexModel.fromJson(Map<String, dynamic> json) => CartIndexModel(
    success: json["success"],
    message: json["message"],
    carts: List<Cart>.from((json["carts"] ?? []).map((x) => Cart.fromJson(x))),
    dateData: DateData.fromJson(json["date_data"]),
  );
}

class Cart {
  final int id;
  // final int userId;
  final String total;
  final int propertyId;
  // final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Property property;
  final List<Item> items;

  Cart({
    required this.id,
    // required this.userId,
    required this.total,
    required this.propertyId,
    // required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.property,
    required this.items,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    // userId: int.parse(json["user_id"].toString()),
    total: json["total"],
    propertyId: int.parse(json["property_id"].toString()),
    // date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    property: Property.fromJson(json["property"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );
}


class Item {
  final int id;
  final int cartId;
  final dynamic propertyId;
  final String itemName;
  final double itemPrice;
  final int itemQty;
  final String rowSum;
  final dynamic quantity;
  final dynamic attributes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    cartId: int.parse((json["cart_id"].toString())),
    propertyId: json["property_id"],
    itemName: json["item_name"],
    itemPrice: double.parse((json["item_price"].toString())).toDouble(),
    itemQty: int.parse((json["item_qty"].toString())).toInt(),
    rowSum: json["row_sum"],
    quantity: json["quantity"],
    attributes: json["attributes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}

class Property {
  final int id;
  final int userId;
  final String identifier;
  final String propertyType;
  final String description;
  final String newContactName;
  final String newContactNumber;
  final dynamic accessInformation;
  final dynamic addressApartment;
  final dynamic addressNumber;
  final dynamic addressStreet;
  final String address;
  final String access;
  final dynamic city;
  final String postcode;
  final dynamic country;
  final int rowStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Property({
    required this.id,
    required this.userId,
    required this.identifier,
    required this.propertyType,
    required this.description,
    required this.newContactName,
    required this.newContactNumber,
    required this.accessInformation,
    required this.addressApartment,
    required this.addressNumber,
    required this.addressStreet,
    required this.address,
    required this.access,
    required this.city,
    required this.postcode,
    required this.country,
    required this.rowStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    userId: int.parse(json["user_id"].toString()),
    identifier: json["identifier"],
    propertyType: json["property_type"],
    description: json["description"] ?? "",
    newContactName: json["new_contact_name"],
    newContactNumber: json["new_contact_number"],
    accessInformation: json["access_information"],
    addressApartment: json["address_apartment"],
    addressNumber: json["address_number"],
    addressStreet: json["address_street"],
    address: json["address"],
    access: json["access"],
    city: json["city"],
    postcode: json["postcode"],
    country: json["country"],
    rowStatus: int.parse(json["row_status"].toString()),
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
    id: int.parse(json["id"].toString()),
    dateValue: json["date_value"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}