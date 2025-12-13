import 'package:cycleiq_saas_mobile/src/register_bags/model/bag_info_model.dart';

enum RegisterBagStatus { initial, loading, success, failure }

class RegisterBagsState {
  final List<BagInfoModel> registeredBags;
  final RegisterBagStatus status;
  final String? message;

  const RegisterBagsState({
    this.registeredBags = const [],
    this.status = RegisterBagStatus.initial,
    this.message,
  });

  RegisterBagsState copyWith({
    List<BagInfoModel>? registeredBags,
    RegisterBagStatus? status,
    String? message,
  }) {
    return RegisterBagsState(
      registeredBags: registeredBags ?? this.registeredBags,
      status: status ?? this.status,
      message: message,
    );
  }
}
