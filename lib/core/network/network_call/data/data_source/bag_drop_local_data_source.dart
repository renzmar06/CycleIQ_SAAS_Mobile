import 'package:cycleiq_saas_mobile/src/bag_drop_limits/model/bag_drop_limit_model.dart';

abstract class BagDropLimitLocalDataSource {
  Future<List<BagDropLimitModel>> getLocalLimits();
}
