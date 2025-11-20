class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      avatarUrl: json["avatar_url"] ?? json["avatar"],
    );
  }
}
