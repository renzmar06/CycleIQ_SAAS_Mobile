import 'dart:typed_data';
import 'package:equatable/equatable.dart';

enum QRStatus { initial, loading, loaded, error }

class QRState extends Equatable {
  final QRStatus status;
  final String? qrId;
  final String? userName;
  final Uint8List? qrBytes;
  final String? message;

  const QRState({
    this.status = QRStatus.initial,
    this.qrId,
    this.userName,
    this.qrBytes,
    this.message,
  });

  QRState copyWith({
    QRStatus? status,
    String? qrId,
    String? userName,
    Uint8List? qrBytes,
    String? message,
  }) {
    return QRState(
      status: status ?? this.status,
      qrId: qrId ?? this.qrId,
      userName: userName ?? this.userName,
      qrBytes: qrBytes ?? this.qrBytes,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, qrId, qrBytes, userName, message];
}
