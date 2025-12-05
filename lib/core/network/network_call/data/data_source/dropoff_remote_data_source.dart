import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';

abstract class DropOffRemoteDataSource {
  Future<List<DropOffLocation>> fetchDropOffLocations();
}
