import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/model/bag_info_model.dart';

abstract class DropOffRepository {
  Future<List<DropOffLocation>> getLocations();
  Future<BagInfoModel> getBagInfo(String qrId);
  Future<String> submitOperatorCheckIn(Map<String, dynamic> body);
}
