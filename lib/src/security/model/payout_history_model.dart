class PayoutHistoryModel {
  final int id;
  final String date;
  final double amount;
  final String status;
  final String note;

  PayoutHistoryModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
    required this.note,
  });

  factory PayoutHistoryModel.fromJson(Map<String, dynamic> json) {
    return PayoutHistoryModel(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      note: json['note'] ?? '',
    );
  }
}
