class WalletModel {
  final double balance;
  final String currency;

  WalletModel({required this.balance, required this.currency});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'INR',
    );
  }
}
