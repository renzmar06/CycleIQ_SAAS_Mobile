import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/base_bloc.dart';
import '../../../core/error/model/error_response_model.dart';
import '../../../core/network/network_call/domain/repository/auth_repository.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(const RegisterState()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    // Check matching passwords
    if (event.password != event.confirmPassword) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorModel: ErrorModel(message: "Passwords do not match"),
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final String body = jsonEncode({
        "fullName": event.name,
        "email": event.email,
        "password": event.password,
        "phone": event.phone,
        "customerType": "individual",
      });
      final response = await authRepository.register(body);

      response.fold(
        (failure) {
          final error = handleException(failure);
          emit(
            state.copyWith(status: RegisterStatus.failure, errorModel: error),
          );
        },
        (data) {
          emit(state.copyWith(status: RegisterStatus.success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorModel: ErrorModel(message: e.toString(), code: "1003"),
        ),
      );
    }
  }
}
