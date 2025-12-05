import 'dart:io';
import 'material_item.dart';

class BagDetailsRequest {
  final String bagQrId;
  final List<MaterialItem> materials;
  final List<String> images; // Local file paths
  final File? videoFile; // Optional
  final String? notes;

  BagDetailsRequest({
    required this.bagQrId,
    required this.materials,
    required this.images,
    this.videoFile,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
    "bagQrId": bagQrId,
    "materials": materials.map((e) => e.toJson()).toList(),
    "notes": notes,
  };
}
