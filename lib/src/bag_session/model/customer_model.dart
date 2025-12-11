class CustomerModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;

  CustomerModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json["_id"],
      fullName: json["fullName"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
    );
  }
}
