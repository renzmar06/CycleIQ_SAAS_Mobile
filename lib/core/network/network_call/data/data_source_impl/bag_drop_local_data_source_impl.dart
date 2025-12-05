import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_drop_local_data_source.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop_limits/model/bag_drop_limit_model.dart';

class BagDropLimitLocalDataSourceImpl implements BagDropLimitLocalDataSource {
  @override
  Future<List<BagDropLimitModel>> getLocalLimits() async {
    return [
      BagDropLimitModel(
        name: "Plastic 1 (PETE)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 2 (HDPE)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 3 (PVC)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 4 (LDPE)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 5 (PP)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 6 (PS)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic 7 (Other)",
        icon: "🍾",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(name: "Aluminum", icon: "🥫", limit: "25 lb / day"),
      BagDropLimitModel(
        name: "Paperboard Carton",
        icon: "📦",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Multilayer Pouch",
        icon: "🛍️",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(
        name: "Plastic Pouch",
        icon: "🛍️",
        limit: "25 lb / day",
      ),
      BagDropLimitModel(name: "Bag-in-Box", icon: "📦", limit: "50 lb / day"),
    ];
  }
}
