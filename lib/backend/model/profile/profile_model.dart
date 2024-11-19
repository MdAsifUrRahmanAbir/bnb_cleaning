class ProfileModel {
  User user;
  AdditionalInfo additionalInfo;

  ProfileModel({
    required this.user,
    required this.additionalInfo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    user: User.fromJson(json["user"]),
    additionalInfo: AdditionalInfo.fromJson(json["additional_info"]),
  );
}

class AdditionalInfo {
  String phone;
  String company;
  String postalCode;

  AdditionalInfo({
    required this.phone,
    required this.company,
    required this.postalCode,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
    phone: json["phone"] ?? "",
    company: json["company"] ?? "",
    postalCode: json["postal_code"] ?? "",
  );
}

class User {
  String name;
  String email;
  String profilePhotoPath;

  User({
    required this.name,
    required this.email,
    required this.profilePhotoPath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    profilePhotoPath: json["profile_photo_path"] ?? "",
  );
}