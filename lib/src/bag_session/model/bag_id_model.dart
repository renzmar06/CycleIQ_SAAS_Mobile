import 'bag_material_model.dart';

class BagIdModel {
  final String id;
  final String bagQrId;
  final List<BagMaterial> materials;
  final List<String> images;

  BagIdModel({
    required this.id,
    required this.bagQrId,
    required this.materials,
    required this.images,
  });

  factory BagIdModel.fromJson(Map<String, dynamic> json) {
    return BagIdModel(
      id: json["_id"],
      bagQrId: json["bagQrId"],
      materials: (json["materials"] as List)
          .map((m) => BagMaterial.fromJson(m))
          .toList(),
      images: List<String>.from(json["images"] ?? []),
    );
  }
}
