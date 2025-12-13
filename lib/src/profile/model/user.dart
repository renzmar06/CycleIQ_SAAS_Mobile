class ProfileResponse {
  final bool success;
  final ProfileUser? user;

  ProfileResponse({required this.success, this.user});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'] ?? false,
      user: json['user'] != null ? ProfileUser.fromJson(json['user']) : null,
    );
  }
}

class ProfileUser {
  final String id;
  final String name;
  final String email;
  final String role;
  final String customerType;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String notes;
  final String idProofImage;
  final String addressProofImage;
  final String totalBags;
  final String kgCo2Saved;
  final String totalEarned;

  ProfileUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.customerType,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.notes,
    required this.idProofImage,
    required this.addressProofImage,
    required this.totalBags,
    required this.kgCo2Saved,
    required this.totalEarned,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      role: json['role'] ?? "",
      customerType: json['customerType'] ?? "",
      phone: json['phone'] ?? "",
      address: json['address'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      zipCode: json['zipCode'] ?? "",
      notes: json['notes'] ?? "",
      idProofImage: json['idProofImage'] ?? "",
      addressProofImage: json['addressProofImage'] ?? "",
      totalBags: json['totalBags'].toString(),
      kgCo2Saved: json['kgCo2Saved'].toString(),
      totalEarned: json['totalEarned'].toString(),
    );
  }
}
