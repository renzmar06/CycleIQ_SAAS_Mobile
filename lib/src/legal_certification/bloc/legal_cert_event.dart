import 'package:equatable/equatable.dart';

abstract class LegalCertEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleAgreementEvent extends LegalCertEvent {
  final bool value;
  ToggleAgreementEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SubmitCertificationEvent extends LegalCertEvent {}
