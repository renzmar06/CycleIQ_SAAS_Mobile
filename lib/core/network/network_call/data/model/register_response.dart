class RegisterResponse {
  final bool error;
  final String message;
  final RegisterData? data;

  RegisterResponse({required this.error, required this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
    );
  }
}

class RegisterData {
  final int userId;
  final String name;
  final String email;
  final String phone;
  final String token;

  RegisterData({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      token: json['token'] ?? "",
    );
  }
}
