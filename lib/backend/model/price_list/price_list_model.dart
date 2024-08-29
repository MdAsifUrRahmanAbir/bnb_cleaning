class PriceListModel {
  List<AirbnbCleaning> linenHires;
  List<AirbnbCleaning> airbnbCleanings;
  List<AirbnbCleaning> midCleanings;
  List<Bundle> bundles;
  List<Bundle> products;

  PriceListModel({
    required this.linenHires,
    required this.airbnbCleanings,
    required this.midCleanings,
    required this.bundles,
    required this.products,
  });

  factory PriceListModel.fromJson(Map<String, dynamic> json) => PriceListModel(
    linenHires: List<AirbnbCleaning>.from(json["linen_hires"].map((x) => AirbnbCleaning.fromJson(x))),
    airbnbCleanings: List<AirbnbCleaning>.from(json["airbnb_cleanings"].map((x) => AirbnbCleaning.fromJson(x))),
    midCleanings: List<AirbnbCleaning>.from(json["mid_cleanings"].map((x) => AirbnbCleaning.fromJson(x))),
    bundles: List<Bundle>.from(json["bundles"].map((x) => Bundle.fromJson(x))),
    products: List<Bundle>.from(json["products"].map((x) => Bundle.fromJson(x))),
  );
}

class AirbnbCleaning {
  int id;
  String categoryName;
  String title;
  int price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String details;
  int rowStatus;

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
    categoryName: json["category_name"],
    title: json["title"],
    price: json["price"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: json["details"],
    rowStatus: json["row_status"],
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
  int isProduct;

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
    details: json["details"],
    price: json["price"],
    image: json["image"],
    rowStatus: json["row_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isProduct: json["is_product"],
  );
}