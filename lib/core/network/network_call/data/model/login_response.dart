class LoginResponse {
  final bool error;
  final String message;
  final LoginData? data;

  LoginResponse({required this.error, required this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final String token;
  final int userId;
  final String name;

  LoginData({required this.token, required this.userId, required this.name});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] ?? "",
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? "",
    );
  }
}
