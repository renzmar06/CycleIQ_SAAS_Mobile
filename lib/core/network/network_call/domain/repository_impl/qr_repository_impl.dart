import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/qr_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QRRepositoryImpl implements QRRepository {
  final QRRemoteDataSource remote;

  QRRepositoryImpl(this.remote);

  @override
  Future<Either<Exception, Map<String, dynamic>>> fetchQRCode() async {
    try {
      final res = await remote.fetchQR();
      return Right(res);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
