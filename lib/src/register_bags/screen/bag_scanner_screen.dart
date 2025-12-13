import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerDialog extends StatelessWidget {
  const QRScannerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 350,
        width: 300,
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              "Scan Bag QR",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MobileScanner(
                    onDetect: (barcode) {
                      final code = barcode.barcodes.first.rawValue;
                      if (code != null) {
                        Navigator.pop(context, code); // return result
                      }
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
