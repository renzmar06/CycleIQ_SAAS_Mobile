class BagMaterial {
  final String name;
  final double weight;

  BagMaterial({required this.name, required this.weight});

  factory BagMaterial.fromJson(Map<String, dynamic> json) {
    return BagMaterial(
      name: json["name"],
      weight: (json["weight"] ?? 0).toDouble(),
    );
  }
}
