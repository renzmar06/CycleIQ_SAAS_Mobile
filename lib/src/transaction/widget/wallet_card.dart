import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.green,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wallet Balance",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              SizedBox(height: 4),
              Text(
                "₹ 1,200.00",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
