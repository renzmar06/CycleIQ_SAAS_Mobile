import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class QREvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchQRCodeEvent extends QREvent {}

class ShareQREvent extends QREvent {
  final Uint8List qrBytes;
  ShareQREvent(this.qrBytes);
}
