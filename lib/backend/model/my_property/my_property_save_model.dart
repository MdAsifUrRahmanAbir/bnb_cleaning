class MyPropertySaveModel {
  String message;
  Property property;

  MyPropertySaveModel({
    required this.message,
    required this.property,
  });

  factory MyPropertySaveModel.fromJson(Map<String, dynamic> json) => MyPropertySaveModel(
    message: json["message"],
    property: Property.fromJson(json["property"]),
  );
}

class Property {
  int userId;
  String identifier;
  String propertyType;
  String description;
  String newContactName;
  String newContactNumber;
  String access;
  String address;
  String postcode;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Property({
    required this.userId,
    required this.identifier,
    required this.propertyType,
    required this.description,
    required this.newContactName,
    required this.newContactNumber,
    required this.access,
    required this.address,
    required this.postcode,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    userId: json["user_id"],
    identifier: json["identifier"],
    propertyType: json["property_type"],
    description: json["description"],
    newContactName: json["new_contact_name"],
    newContactNumber: json["new_contact_number"],
    access: json["access"],
    address: json["address"],
    postcode: json["postcode"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );
}