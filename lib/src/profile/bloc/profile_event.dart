abstract class ProfileEvent {
  const ProfileEvent();
}

class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String phone;
  final String? avatarPathOrUrl;

  const UpdateProfileEvent({
    required this.name,
    required this.phone,
    this.avatarPathOrUrl,
  });
}

class LogoutProfileEvent extends ProfileEvent {
  const LogoutProfileEvent();
}
