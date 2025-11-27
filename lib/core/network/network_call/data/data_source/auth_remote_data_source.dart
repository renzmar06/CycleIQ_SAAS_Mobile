abstract class AuthRemoteDataSource {
  Future<dynamic> login(String body);
  Future<dynamic> register(String body);
}
