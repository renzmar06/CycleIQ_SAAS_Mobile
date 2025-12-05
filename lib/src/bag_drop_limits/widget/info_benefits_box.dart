import 'package:flutter/material.dart';

class InfoBenefitsBox extends StatelessWidget {
  const InfoBenefitsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9FFF1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBEEFD2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text(
                "Program Benefits",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 12),
          _benefit("Drop off anytime at 24/7 drop zones"),
          _benefit("Pre-register bags with QR codes"),
          _benefit("Earn sponsor bonuses and points"),
          _benefit("Excess materials still get scrap value"),
        ],
      ),
    );
  }
}

class _benefit extends StatelessWidget {
  final String text;
  const _benefit(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
