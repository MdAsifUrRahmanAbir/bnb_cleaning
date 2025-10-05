class PriceListModel {
  List<AirbnbCleaning> linenHires;
  List<AirbnbCleaning> airbnbCleanings;
  List<AirbnbCleaning> midCleanings;
  List<Bundle> bundles;
  List<Bundle> products;
  List<Extra> extras;

  PriceListModel({
    required this.linenHires,
    required this.airbnbCleanings,
    required this.midCleanings,
    required this.bundles,
    required this.products,
    required this.extras,
  });

  factory PriceListModel.fromJson(Map<String, dynamic> json) => PriceListModel(
    linenHires: List<AirbnbCleaning>.from(json["linen_hires"].map((x) => AirbnbCleaning.fromJson(x))),
    airbnbCleanings: List<AirbnbCleaning>.from(json["airbnb_cleanings"].map((x) => AirbnbCleaning.fromJson(x))),
    midCleanings: List<AirbnbCleaning>.from(json["mid_cleanings"].map((x) => AirbnbCleaning.fromJson(x))),
    bundles: List<Bundle>.from(json["bundles"].map((x) => Bundle.fromJson(x))),
    products: List<Bundle>.from(json["products"].map((x) => Bundle.fromJson(x))),
    extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
  );
}

class AirbnbCleaning {
  int id;
  String categoryName;
  String title;
  double price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String details;
  dynamic rowStatus;

  AirbnbCleaning({
    required this.id,
    required this.categoryName,
    required this.title,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.rowStatus,
  });

  factory AirbnbCleaning.fromJson(Map<String, dynamic> json) => AirbnbCleaning(
    id: json["id"],
    categoryName: json["category_name"] ?? "",
    title: json["title"],
    price: double.parse(json["price"].toString()).toDouble(),
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: json["details"] ?? "",
    rowStatus: json["row_status"] ?? "",
  );
}

class Bundle {
  int id;
  String name;
  String details;
  String price;
  String image;
  int rowStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic isProduct;

  Bundle({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.image,
    required this.rowStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.isProduct,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) => Bundle(
    id: json["id"],
    name: json["name"],
    details: json["details"] ?? "",
    price: json["price"],
    image: json["image"],
    rowStatus: int.parse(json["row_status"].toString()),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isProduct: json["is_product"] ?? "",
  );
}

class Extra {
  final String name;
  final double price;

  Extra({
    required this.name,
    required this.price,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    name: json["name"],
    price: json["price"].toDouble(),
  );
}