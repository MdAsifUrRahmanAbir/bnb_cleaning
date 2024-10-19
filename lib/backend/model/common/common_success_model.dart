class CommonSuccessModel {
  String message;
  bool success;

  CommonSuccessModel({
    required this.message,
    required this.success,
  });

  factory CommonSuccessModel.fromJson(Map<String, dynamic> json) => CommonSuccessModel(
    message: json["message"],
    success: json["success"] ?? true,
  );
}