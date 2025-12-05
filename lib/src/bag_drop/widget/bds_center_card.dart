import 'package:flutter/material.dart';

class BDSCenterCard extends StatelessWidget {
  const BDSCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 38,
            backgroundColor: Color(0xFF22C575),
            child: Icon(
              Icons.inventory_2_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Ready to Drop Off?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Let's register your bags and start earning rewards!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
