class TicketModel {
  final String id;
  final String date;
  final int bagCount;
  final double weight;
  final double amount;
  final int points;
  final List<String> bonuses;

  TicketModel({
    required this.id,
    required this.date,
    required this.bagCount,
    required this.weight,
    required this.amount,
    required this.points,
    required this.bonuses,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['_id'],
      date: json['date'],
      bagCount: json['bagCount'],
      weight: (json['weight'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      points: json['points'],
      bonuses: List<String>.from(json['bonuses']),
    );
  }
}
