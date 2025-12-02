import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/profile_repository.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(const ProfileState()) {
    on<FetchProfileEvent>(_onFetchProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UploadProfileImageEvent>(_onUploadImage);
  }

  Future<void> _onFetchProfile(
    FetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    final res = await profileRepository.fetchProfile();
    res.fold(
      (err) {
        emit(
          state.copyWith(
            status: ProfileStatus.failure,
            errorMessage: err.toString(),
          ),
        );
      },
      (data) {
        emit(state.copyWith(status: ProfileStatus.success, user: data.user));
      },
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.updating));

    final body = event.data;
    final res = await profileRepository.updateProfile(body);

    res.fold(
      (err) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: err.toString(),
        ),
      ),
      (data) => emit(
        state.copyWith(status: ProfileStatus.updateSuccess, user: data.user),
      ),
    );
  }

  Future<void> _onUploadImage(
    UploadProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.imageUploading));

    final res = await profileRepository.uploadImage(event.file);

    res.fold(
      (err) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: err.toString(),
        ),
      ),
      (_) {
        add(FetchProfileEvent()); // refresh profile
      },
    );
  }
}
