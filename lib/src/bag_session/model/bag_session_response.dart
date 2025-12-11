import 'bag_session_model.dart';

class BagSessionResponse {
  final bool success;
  final int pendingCount;
  final int completedCount;
  final int alertsCount;
  final int receivedCount;
  final BagSessionModel? data;

  BagSessionResponse({
    required this.success,
    required this.pendingCount,
    required this.completedCount,
    required this.alertsCount,
    required this.receivedCount,
    required this.data,
  });

  factory BagSessionResponse.fromJson(Map<String, dynamic> json) {
    return BagSessionResponse(
      success: json["success"] ?? false,
      pendingCount: json["pendingCount"] ?? 0,
      completedCount: json["completedCount"] ?? 0,
      alertsCount: json["alertsCount"] ?? 0,
      receivedCount: json["receivedCount"] ?? 0,
      data: json["data"] != null
          ? BagSessionModel.fromJson(json["data"])
          : null,
    );
  }
}
