import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_drop_local_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_drop_limit_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop_limits/model/bag_drop_limit_model.dart';

class BagDropLimitRepositoryImpl implements BagDropLimitRepository {
  final NetworkInfo networkInfo;
  final BagDropLimitLocalDataSource remoteDataSource;
  final PreferencesUtil pref;

  BagDropLimitRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.pref,
  });

  @override
  Future<List<BagDropLimitModel>> fetchLimits() async {
    return await remoteDataSource.getLocalLimits();
  }
}
