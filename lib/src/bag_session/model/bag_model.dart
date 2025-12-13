class MaterialItem {
  final String name;
  final double weight;

  MaterialItem({required this.name, required this.weight});

  factory MaterialItem.fromJson(Map<String, dynamic> json) {
    return MaterialItem(
      name: json["name"] ?? "",
      weight: (json["weight"] ?? 0).toDouble(),
    );
  }
}

class BagModel {
  final String id;
  final String bagQrId;
  final List<MaterialItem> materials;
  final List<String> images;
  final List<String> videos;
  final String notes;

  BagModel({
    required this.id,
    required this.bagQrId,
    required this.materials,
    required this.images,
    required this.videos,
    required this.notes,
  });

  factory BagModel.fromJson(Map<String, dynamic> json) {
    return BagModel(
      id: json["_id"],
      bagQrId: json["bagQrId"],
      materials: (json["materials"] as List)
          .map((e) => MaterialItem.fromJson(e))
          .toList(),
      images: List<String>.from(json["images"] ?? []),
      videos: List<String>.from(json["videos"] ?? []),
      notes: json["notes"] ?? "",
    );
  }
}
