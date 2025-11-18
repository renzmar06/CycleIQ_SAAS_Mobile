import 'package:equatable/equatable.dart';
import '../../../core/error/model/error_response_model.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final ErrorModel? errorModel;

  const RegisterState({this.status = RegisterStatus.initial, this.errorModel});

  RegisterState copyWith({RegisterStatus? status, ErrorModel? errorModel}) {
    return RegisterState(status: status ?? this.status, errorModel: errorModel);
  }

  @override
  List<Object?> get props => [status, errorModel];
}
