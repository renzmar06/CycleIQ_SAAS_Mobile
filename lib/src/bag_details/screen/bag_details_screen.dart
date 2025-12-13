import 'dart:io';
import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_bloc.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_event.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

class BagDetailsViewScreen extends StatelessWidget {
  final String qrId;

  const BagDetailsViewScreen({super.key, required this.qrId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          BagDetailsBloc(repository: serviceLocator<BagDetailsRepository>())
            ..add(FetchBagDetails(qrId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bag Details"),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<BagDetailsBloc, BagDetailsState>(
          builder: (context, state) {
            if (state.status == BagDetailsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == BagDetailsStatus.failure) {
              return Center(
                child: Text(
                  state.error ?? "Something went wrong",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.status == BagDetailsStatus.success) {
              final bag = state.bag!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔥 QR + ACTION BUTTONS
                    _qrHeader(context, bag.id),

                    const SizedBox(height: 20),

                    /// BAG QR TEXT
                    Text(
                      "Bag QR: ${bag.bagQrId}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// IMAGES
                    if (bag.images.isNotEmpty)
                      SizedBox(
                        height: 140,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: bag.images.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemBuilder: (_, i) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "${ApiConfig.domain}${bag.images[i]}",
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 20),

                    const Text(
                      "Material Breakdown",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    ...bag.materials.map(
                      (m) => ListTile(
                        title: Text(m.name),
                        trailing: Text("${m.weight} kg"),
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  // ----------------------------------------------------------------
  // 🔥 QR HEADER WITH ACTION BUTTONS: Download | Share | Print
  // ----------------------------------------------------------------
  Widget _qrHeader(BuildContext context, String qrId) {
    return Column(
      children: [
        Center(
          child: QrImageView(
            data: qrId,
            size: 160,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _actionButton(
              icon: Icons.download,
              label: "Download",
              onTap: () => _downloadQr(context, qrId),
            ),
            const SizedBox(width: 12),
            _actionButton(
              icon: Icons.share,
              label: "Share",
              onTap: () => _shareQr(qrId),
            ),
            const SizedBox(width: 12),
            _actionButton(
              icon: Icons.print,
              label: "Print",
              onTap: () => _printQr(qrId),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green.withOpacity(0.15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green, size: 20),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------------
  // 🔥 DOWNLOAD QR AS PNG
  // ----------------------------------------------------------------
  Future<void> _downloadQr(BuildContext context, String qr) async {
    try {
      final picData = await QrPainter(
        data: qr,
        version: QrVersions.auto,
        color: Colors.black,
        emptyColor: Colors.white,
      ).toImageData(800);

      final bytes = picData!.buffer.asUint8List();

      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/$qr.png");
      await file.writeAsBytes(bytes);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("QR Code downloaded.")));
    } catch (e) {
      debugPrint("Download error: $e");
    }
  }

  // ----------------------------------------------------------------
  // 🔥 SHARE QR IMAGE
  // ----------------------------------------------------------------
  Future<void> _shareQr(String qr) async {
    final picData = await QrPainter(
      data: qr,
      version: QrVersions.auto,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImageData(800);

    final bytes = picData!.buffer.asUint8List();

    final temp = await getTemporaryDirectory();
    final file = File("${temp.path}/$qr.png");
    await file.writeAsBytes(bytes);

    await Share.shareXFiles([XFile(file.path)], text: "Bag QR Code: $qr");
  }

  // ----------------------------------------------------------------
  // 🔥 PRINT QR CODE
  // ----------------------------------------------------------------
  Future<void> _printQr(String qr) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        final qrImage = await QrPainter(
          data: qr,
          version: QrVersions.auto,
          color: Colors.black,
          emptyColor: Colors.white,
        ).toImageData(800);

        return qrImage!.buffer.asUint8List();
      },
    );
  }
}
