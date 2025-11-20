abstract class ProfileRemoteDataSource {
  Future<dynamic> getProfile();
  Future<dynamic> updateProfile(String name, String phone, String? avatarPath);
  Future<dynamic> logout();
}
