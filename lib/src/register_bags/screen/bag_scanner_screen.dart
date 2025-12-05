import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BagScannerScreen extends StatelessWidget {
  const BagScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Bag QR")),
      body: MobileScanner(
        onDetect: (barcode) {
          final code = barcode.barcodes.first.rawValue;
          if (code != null) {
            Navigator.pop(context, code);
          }
        },
      ),
    );
  }
}
