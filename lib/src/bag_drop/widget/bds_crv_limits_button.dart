import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:flutter/material.dart';

class BDSCRVLimitsButton extends StatelessWidget {
  const BDSCRVLimitsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNav.push(context, '/bag-drop-limit'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green, width: 1.5),
        ),
        child: const Center(
          child: Text(
            "View Bag & Drop CRV Limits",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
