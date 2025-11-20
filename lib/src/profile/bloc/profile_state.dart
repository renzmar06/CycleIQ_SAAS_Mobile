import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';

enum ProfileStatus { initial, loading, success, failure, updating, loggingOut }

class ProfileState {
  final ProfileStatus status;
  final UserModel? user;
  final String? error;

  ProfileState({this.status = ProfileStatus.initial, this.user, this.error});

  ProfileState copyWith({
    ProfileStatus? status,
    UserModel? user,
    String? error,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
