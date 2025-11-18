import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/login_response.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/register_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, LoginResponse>> login(String email, String password);
  Future<Either<Exception, RegisterResponse>> register(
    String name,
    String email,
    String phone,
    String password,
  );
}
