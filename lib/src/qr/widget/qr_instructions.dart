import 'package:flutter/material.dart';

class QRInstructions extends StatelessWidget {
  const QRInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How to use your QR:",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          _Step(
            "1. Print QR stickers and place inside each bag before drop-off",
          ),
          _Step("2. Show this screen to operators for instant identification"),
          _Step("3. Use at rewards kiosks to redeem points"),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String text;
  const _Step(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
