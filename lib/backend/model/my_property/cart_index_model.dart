
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
  final int userId;
  final String total;
  final int propertyId;
  // final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Property property;

  Cart({
    required this.id,
    required this.userId,
    required this.total,
    required this.propertyId,
    // required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.property,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    userId: json["user_id"],
    total: json["total"],
    propertyId: json["property_id"],
    // date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    property: Property.fromJson(json["property"]),
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
    userId: json["user_id"],
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
    rowStatus: json["row_status"],
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