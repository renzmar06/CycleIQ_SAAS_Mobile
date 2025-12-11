import 'bag_id_model.dart';

class BagSessionItem {
  final BagIdModel bagId;
  final List<String> sessionImages;
  final String status;
  final DateTime createdAt;

  BagSessionItem({
    required this.bagId,
    required this.sessionImages,
    required this.status,
    required this.createdAt,
  });

  factory BagSessionItem.fromJson(Map<String, dynamic> json) {
    return BagSessionItem(
      bagId: BagIdModel.fromJson(json["bagId"]),
      sessionImages: List<String>.from(json["sessionImages"] ?? []),
      status: json["status"] ?? "",
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
