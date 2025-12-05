class DropOffLocation {
  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;
  final bool isOpen;
  final String? image;

  DropOffLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.isOpen,
    this.image,
  });

  factory DropOffLocation.fromJson(Map<String, dynamic> json) {
    return DropOffLocation(
      id: json["_id"],
      name: json["businessName"] ?? "",
      address: json["address"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      isOpen: true, // backend does not send open/closed yet
      image: json["image"],
    );
  }
}
