import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileState()) {
    on<LoadProfileEvent>(_load);
    on<UpdateProfileEvent>(_update);
    on<LogoutProfileEvent>(_logout);
  }

  Future<void> _load(LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    final result = await profileRepository.getProfile();

    result.fold(
      (e) => emit(
        state.copyWith(status: ProfileStatus.failure, error: e.toString()),
      ),
      (user) => emit(state.copyWith(status: ProfileStatus.success, user: user)),
    );
  }

  Future<void> _update(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.updating));

    final result = await profileRepository.updateProfile(
      name: event.name,
      phone: event.phone,
      avatarPath: event.avatarPathOrUrl,
    );

    result.fold(
      (e) => emit(
        state.copyWith(status: ProfileStatus.failure, error: e.toString()),
      ),
      (user) => emit(state.copyWith(status: ProfileStatus.success, user: user)),
    );
  }

  Future<void> _logout(
    LogoutProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loggingOut));

    final result = await profileRepository.logout();

    result.fold(
      (e) => emit(
        state.copyWith(status: ProfileStatus.failure, error: e.toString()),
      ),
      (_) => emit(ProfileState(status: ProfileStatus.initial)),
    );
  }
}
