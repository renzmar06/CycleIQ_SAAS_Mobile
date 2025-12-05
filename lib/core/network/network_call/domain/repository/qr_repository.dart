import 'package:dartz/dartz.dart';

abstract class QRRepository {
  Future<Either<Exception, Map<String, dynamic>>> fetchQRCode();
}
