class RegistrationModel {
  User user;

  RegistrationModel({
    required this.user,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    user: User.fromJson(json["user"]),
  );
}

class User {
  String name;
  String email;
  int userSignupId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String profilePhotoUrl;
  List<Role> roles;

  User({
    required this.name,
    required this.email,
    required this.userSignupId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.profilePhotoUrl,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    userSignupId: json["user_signup_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    profilePhotoUrl: json["profile_photo_url"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );
}

class Role {
  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );
}

class Pivot {
  int modelId;
  int roleId;
  String modelType;

  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: int.parse(json["model_id"].toString()),
    roleId: int.parse(json["role_id"].toString()),
    modelType: json["model_type"],
  );
}