import 'package:equatable/equatable.dart';

class LegalCertState extends Equatable {
  final bool isAgreed;
  final bool submitting;
  final bool success;

  const LegalCertState({
    this.isAgreed = false,
    this.submitting = false,
    this.success = false,
  });

  LegalCertState copyWith({bool? isAgreed, bool? submitting, bool? success}) {
    return LegalCertState(
      isAgreed: isAgreed ?? this.isAgreed,
      submitting: submitting ?? this.submitting,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [isAgreed, submitting, success];
}
