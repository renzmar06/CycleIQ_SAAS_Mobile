import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/auth_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_drop_limit_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/notification_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/product_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/profile_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/ticket_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/tickets_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/auth_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/bag_details_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/bag_drop_limit_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/dropoff_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/notification_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/product_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/profile_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/ticket_repository_impl.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository_impl/tickets_repository_impl.dart';

Future<void> initDomainDI() async {
  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BagDropLimitRepository>(
    () => BagDropLimitRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BagDropLimitRepository>(
    () => BagDropLimitRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DropOffRepository>(
    () => DropOffRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BagDetailsRepository>(
    () => BagDetailsRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      pref: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<TicketsRepository>(
    () => TicketsRepositoryImpl(remoteDataSource: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(remoteDataSource: serviceLocator()),
  );
}
