import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/base_bloc.dart';
import '../../../core/error/model/error_response_model.dart';
import '../../../core/network/network_call/domain/repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final pref = serviceLocator<PreferencesUtil>();

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final response = await authRepository.login(event.email, event.password);

      await response.fold(
        (failure) async {
          ErrorModel error = handleException(failure);
          emit(state.copyWith(status: LoginStatus.failure, errorModel: error));
        },
        (data) async {
          await pref.saveLoginData(data);
          emit(state.copyWith(status: LoginStatus.success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorModel: ErrorModel(message: e.toString(), code: "1003"),
        ),
      );
    }
  }
}
