import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  fetchSuccess,
  updateSuccess,
  failure,
  updating,
  imageUploading,
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final ProfileUser? user;
  final String? errorMessage;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileUser? user,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
