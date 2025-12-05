import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCard extends StatelessWidget {
  final String? userId;
  const QRCard({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    log("dnjsndnjjs$userId");
    return _qrCard(userId ?? '');

    // return BlocBuilder<QRBloc, QRState>(
    //   builder: (context, state) {
    //     if (state.status == QRStatus.loading) {
    //       return _shimmer();
    //     }

    //     if (state.status == QRStatus.loaded) {
    //       return _qrCard(state, userId);
    //     }

    //     return _shimmer();
    //   },
    // );
  }

  Widget _qrCard(
    // QRState state,
    String userId,
  ) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: _cardBox,
      child: Column(
        children: [
          RepaintBoundary(
            key: qrBoundaryKey,
            child: QrImageView(
              data: userId,
              size: 180,
              version: QrVersions.auto,
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(40, 40),
              ),
            ),
          ),
          const SizedBox(height: 18),
          // Text(
          //   state.userName ?? "User",
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          // ),
          Text("ID: $userId", style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  BoxDecoration get _cardBox => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
  );

  Widget _shimmer() {
    return Container(
      height: 260,
      width: 260,
      decoration: _cardBox,
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

final GlobalKey qrBoundaryKey = GlobalKey();
