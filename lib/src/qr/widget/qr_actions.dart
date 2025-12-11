import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';

import 'package:cycleiq_saas_mobile/src/qr/widget/qr_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class QRActions extends StatelessWidget {
  const QRActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _button("Download QR", Icons.download, downloadQR),
        const SizedBox(height: 12),
        _button("Print QR Stickers", Icons.print, printQR),
        const SizedBox(height: 12),
        _button("Share QR", Icons.share, shareQR),
        const SizedBox(height: 12),
        _button("Order QR Pack", Icons.shopping_bag_outlined, () {}),
      ],
    );
  }

  Widget _button(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ PERFECT QR CAPTURE (NO BLACK BACKGROUND)
  Future<Uint8List> _captureQR() async {
    await Future.delayed(const Duration(milliseconds: 50)); // let UI render

    final boundary =
        qrBoundaryKey.currentContext!.findRenderObject()
            as RenderRepaintBoundary;

    final image = await boundary.toImage(pixelRatio: 4.0);

    final byteData = await image.toByteData(format: ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  // ✅ DOWNLOAD
  Future<void> downloadQR() async {
    Uint8List bytes = await _captureQR();

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/my_qr.png");
    await file.writeAsBytes(bytes);

    debugPrint("✅ QR Saved to: ${file.path}");
  }

  // ✅ SHARE
  Future<void> shareQR() async {
    Uint8List bytes = await _captureQR();

    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/qr_share.png");
    await file.writeAsBytes(bytes);

    await Share.shareXFiles([XFile(file.path)]);
  }

  // ✅ PRINT TO PDF
  Future<void> printQR() async {
    Uint8List bytes = await _captureQR();

    await Printing.layoutPdf(
      onLayout: (format) async {
        final pdf = pw.Document();
        final image = pw.MemoryImage(bytes);

        pdf.addPage(pw.Page(build: (_) => pw.Center(child: pw.Image(image))));

        return pdf.save();
      },
    );
  }
}
