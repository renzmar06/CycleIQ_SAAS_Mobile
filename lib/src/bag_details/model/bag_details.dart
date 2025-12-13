class BagDetailsModel {
  final String id;
  final String bagQrId;
  final List<MaterialItem> materials;
  final List<String> images;

  BagDetailsModel({
    required this.id,
    required this.bagQrId,
    required this.materials,
    required this.images,
  });

  factory BagDetailsModel.fromJson(Map<String, dynamic> json) {
    return BagDetailsModel(
      id: json["_id"],
      bagQrId: json["bagQrId"],
      materials: (json["materials"] as List)
          .map((e) => MaterialItem.fromJson(e))
          .toList(),
      images: (json["images"] as List).map((e) => e.toString()).toList(),
    );
  }
}

class MaterialItem {
  final String name;
  final double weight;

  MaterialItem({required this.name, required this.weight});

  factory MaterialItem.fromJson(Map<String, dynamic> json) {
    return MaterialItem(
      name: json["name"],
      weight: (json["weight"] as num).toDouble(),
    );
  }
}
