import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/qr_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';

class QRRemoteDataSourceImpl implements QRRemoteDataSource {
  final NetworkClient client;

  QRRemoteDataSourceImpl(this.client);

  @override
  Future<dynamic> fetchQR() async {
    final res = await client.invoke(ApiConfig().getQR, RequestType.get);
    return res.data;
  }
}
