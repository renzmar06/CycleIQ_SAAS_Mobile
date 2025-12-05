import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/auth_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_details_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_drop_local_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/dropoff_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/notification_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/product_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/profile_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/auth_remote_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/bag_details_remote_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/bag_drop_local_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/dropoff_remote_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/notification_remote_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/product_remote_data_source_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source_impl/profile_remote_data_source_impl.dart';

Future<void> initRemoteDI() async {
  serviceLocator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<BagDropLimitLocalDataSource>(
    () => BagDropLimitLocalDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<DropOffRemoteDataSource>(
    () => DropOffRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<BagDetailsRemoteDataSource>(
    () => BagDetailsRemoteDataSourceImpl(networkClient: serviceLocator()),
  );
}
