// class TicketModel {
//   final String id;
//   final String date;
//   final int bagCount;
//   final double weight;
//   final double amount;
//   final int points;
//   final List<String> bonuses;

//   TicketModel({
//     required this.id,
//     required this.date,
//     required this.bagCount,
//     required this.weight,
//     required this.amount,
//     required this.points,
//     required this.bonuses,
//   });

//   factory TicketModel.fromJson(Map<String, dynamic> json) {
//     return TicketModel(
//       id: json['_id'],
//       date: json['date'],
//       bagCount: json['bagCount'],
//       weight: (json['weight'] as num).toDouble(),
//       amount: (json['amount'] as num).toDouble(),
//       points: json['points'],
//       bonuses: List<String>.from(json['bonuses']),
//     );
//   }
// }

class TicketModel {
  final String id;
  final String date;
  final String type;
  final int bagCount;
  final double weight;
  final double payout;
  final int points;
  final double co2Saved;
  final String location;
  final String operatorName;
  final List<TicketMaterial> materials;
  final List<TicketBonus> bonuses;

  TicketModel({
    required this.id,
    required this.date,
    required this.type,
    required this.bagCount,
    required this.weight,
    required this.payout,
    required this.points,
    required this.co2Saved,
    required this.location,
    required this.operatorName,
    required this.materials,
    required this.bonuses,
  });
}

class TicketMaterial {
  final String name;
  final double weight;

  TicketMaterial({required this.name, required this.weight});
}

class TicketBonus {
  final String title;
  final double amount;

  TicketBonus({required this.title, required this.amount});
}
