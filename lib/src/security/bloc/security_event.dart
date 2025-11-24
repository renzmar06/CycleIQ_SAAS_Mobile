import 'package:equatable/equatable.dart';

abstract class SecurityEvent extends Equatable {
  const SecurityEvent();

  @override
  List<Object?> get props => [];
}

class LoadSecurityDataEvent extends SecurityEvent {
  const LoadSecurityDataEvent();
}

class UploadProofEvent extends SecurityEvent {
  final String filePath;
  const UploadProofEvent(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class DonateEvent extends SecurityEvent {
  final double amount;
  final int organizationId;
  const DonateEvent({required this.amount, required this.organizationId});

  @override
  List<Object?> get props => [amount, organizationId];
}

class RefreshPayoutHistoryEvent extends SecurityEvent {
  const RefreshPayoutHistoryEvent();
}
