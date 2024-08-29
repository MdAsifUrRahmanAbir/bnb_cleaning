class PropertyListModel {
  List<Property> properties;

  PropertyListModel({
    required this.properties,
  });

  factory PropertyListModel.fromJson(Map<String, dynamic> json) => PropertyListModel(
    properties: List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
  );
}

class Property {
  int id;
  int userId;
  String identifier;
  String propertyType;
  String description;
  String newContactName;
  String newContactNumber;
  String accessInformation;
  String addressApartment;
  String addressNumber;
  String addressStreet;
  String address;
  String access;
  String city;
  String postcode;
  String country;
  int rowStatus;
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
    id: json["id"],
    userId: json["user_id"],
    identifier: json["identifier"],
    propertyType: json["property_type"],
    description: json["description"],
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