import 'package:equatable/equatable.dart';
import '../../../core/error/model/error_response_model.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final ErrorModel? errorModel;

  const LoginState({this.status = LoginStatus.initial, this.errorModel});

  LoginState copyWith({LoginStatus? status, ErrorModel? errorModel}) {
    return LoginState(status: status ?? this.status, errorModel: errorModel);
  }

  @override
  List<Object?> get props => [status, errorModel];
}
