class ServiceSuccessModel {
  final List<dynamic> success;

  ServiceSuccessModel({
    required this.success,
  });

  factory ServiceSuccessModel.fromJson(Map<String, dynamic> json) => ServiceSuccessModel(
    success: List<dynamic>.from(json["success"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success.map((x) => x)),
  };
}

class SuccessClass {
  final String itemName;
  final double itemPrice;
  final int itemQty;
  final double rowSum;

  SuccessClass({
    required this.itemName,
    required this.itemPrice,
    required this.itemQty,
    required this.rowSum,
  });

  factory SuccessClass.fromJson(Map<String, dynamic> json) => SuccessClass(
    itemName: json["item_name"],
    itemPrice: json["item_price"].toDouble(),
    itemQty: json["item_qty"],
    rowSum: json["row_sum"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "item_price": itemPrice,
    "item_qty": itemQty,
    "row_sum": rowSum,
  };
}
