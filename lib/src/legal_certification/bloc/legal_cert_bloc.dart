import 'package:flutter_bloc/flutter_bloc.dart';
import 'legal_cert_event.dart';
import 'legal_cert_state.dart';

class LegalCertBloc extends Bloc<LegalCertEvent, LegalCertState> {
  LegalCertBloc() : super(const LegalCertState()) {
    on<ToggleAgreementEvent>((event, emit) {
      emit(state.copyWith(isAgreed: event.value));
    });

    on<SubmitCertificationEvent>((event, emit) async {
      emit(state.copyWith(submitting: true));

      await Future.delayed(const Duration(seconds: 1)); // simulate API

      emit(state.copyWith(submitting: false, success: true));
    });
  }
}
