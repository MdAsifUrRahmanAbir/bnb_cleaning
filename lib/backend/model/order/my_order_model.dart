class MyOrderModel {
  final bool success;
  final List<Datum> data;

  MyOrderModel({
    required this.success,
    required this.data,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

class Datum {
  final int id;
  final int orderNo;
  final int userId;
  final String propertyName;
  final double total;
  final double incTotal;
  final String orderStatus;
  final DateTime orderDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Detail> details;

  Datum({
    required this.id,
    required this.orderNo,
    required this.userId,
    required this.propertyName,
    required this.total,
    required this.incTotal,
    required this.orderStatus,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    orderNo: json["order_no"],
    userId: json["user_id"],
    propertyName: json["property_name"],
    total: json["total"]?.toDouble(),
    incTotal: (json["inc_total"] ?? 0).toDouble(),
    orderStatus: json["order_status"],
    orderDate: DateTime.parse(json["order_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );
}

class Detail {
  final int id;
  final int orderId;
  final String itemName;
  final String price;
  final String qty;
  final DateTime createdAt;
  final DateTime updatedAt;

  Detail({
    required this.id,
    required this.orderId,
    required this.itemName,
    required this.price,
    required this.qty,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    orderId: json["order_id"],
    itemName: json["item_name"],
    price: json["price"],
    qty: json["qty"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}