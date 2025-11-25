class LoginResponse {
  final bool success;
  final String message;
  final String token;
  final UserData? user;

  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      token: json['token'] ?? "",
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final int phone;
  final String address;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.phone,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      isAdmin: json['isAdmin'] ?? false,
      phone: json['phone'] ?? 0,
      address: json['address'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
    );
  }
}
