class RewardsModel {
  final int points;
  final String tier;
  final String message;

  RewardsModel({
    required this.points,
    required this.tier,
    required this.message,
  });

  factory RewardsModel.fromJson(Map<String, dynamic> json) {
    return RewardsModel(
      points: json['points'] ?? 0,
      tier: json['tier'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
