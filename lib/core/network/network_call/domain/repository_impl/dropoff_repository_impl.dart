import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/dropoff_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';

class DropOffRepositoryImpl implements DropOffRepository {
  final NetworkInfo networkInfo;
  final DropOffRemoteDataSource remoteDataSource;
  final PreferencesUtil pref;

  DropOffRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.pref,
  });

  @override
  Future<List<DropOffLocation>> getLocations() async {
    return await remoteDataSource.fetchDropOffLocations();
  }
}
