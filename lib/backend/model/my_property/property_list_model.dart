
class MyPropertyModel {
  String message;
  List<Property> properties;

  MyPropertyModel({
    required this.properties,
    required this.message,
  });

  factory MyPropertyModel.fromJson(Map<String, dynamic> json) => MyPropertyModel(
    properties: List<Property>.from((json["properties"] ?? []).map((x) => Property.fromJson(x))),
      message: json["message"] ?? "",
  );
}

class Property {
  dynamic id;
  dynamic userId;
  dynamic identifier;
  dynamic propertyType;
  dynamic description;
  dynamic newContactName;
  dynamic newContactNumber;
  dynamic accessInformation;
  dynamic addressApartment;
  dynamic addressNumber;
  dynamic addressStreet;
  dynamic address;
  dynamic access;
  dynamic city;
  dynamic postcode;
  dynamic country;
  dynamic rowStatus;
  DateTime createdAt;
  DateTime updatedAt;

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
    id: json["id"] ?? "",
    userId: json["user_id"] ?? "",
    identifier: json["identifier"] ?? "",
    propertyType: json["property_type"] ?? "",
    description: json["description"] ?? "",
    newContactName: json["new_contact_name"] ?? "",
    newContactNumber: json["new_contact_number"] ?? "",
    accessInformation: json["access_information"] ?? "",
    addressApartment: json["address_apartment"] ?? "",
    addressNumber: json["address_number"] ?? "",
    addressStreet: json["address_street"] ?? "",
    address: json["address"] ?? "",
    access: json["access"] ?? "",
    city: json["city"] ?? "",
    postcode: json["postcode"],
    country: json["country"] ?? "",
    rowStatus: json["row_status"] ?? "",
    createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
  );
}