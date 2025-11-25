import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class ShowMyQRCard extends StatelessWidget {
  const ShowMyQRCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNav.to(context, "/my-qr"),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.qr_code_rounded, size: 22, color: Colors.black87),
            SizedBox(width: 8),
            Text(
              "SHOW MY QR",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
