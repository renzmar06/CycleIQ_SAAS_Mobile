import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_bloc.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_bloc.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/bloc/expected_bag_count_bloc.dart';
import 'package:cycleiq_saas_mobile/src/home/bloc/home_bloc.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_bloc.dart';
import 'package:cycleiq_saas_mobile/src/notification/bloc/notification_bloc.dart';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_bloc.dart';
import 'package:cycleiq_saas_mobile/src/tickets/bloc/tickets_bloc.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/bloc/ticket_bloc.dart';

Future<void> initPresentationDI() async {
  // serviceLocator.registerFactory<ProductCubit>(
  //   () => ProductCubit(repository: serviceLocator()),
  // );
  serviceLocator.registerFactory<HomeBloc>(
    () => HomeBloc(productRepository: serviceLocator()),
  );
  serviceLocator.registerFactory<LoginBloc>(
    () => LoginBloc(authRepository: serviceLocator()),
  );
  serviceLocator.registerFactory<RegisterBloc>(
    () => RegisterBloc(authRepository: serviceLocator()),
  );
  serviceLocator.registerFactory<ProfileBloc>(
    () => ProfileBloc(profileRepository: serviceLocator()),
  );
  serviceLocator.registerFactory<NotificationBloc>(
    () => NotificationBloc(profileRepository: serviceLocator()),
  );
  serviceLocator.registerFactory<ExpectedBagCountBloc>(
    () => ExpectedBagCountBloc(),
  );
  serviceLocator.registerFactory<DropOffBloc>(
    () => DropOffBloc(repository: serviceLocator()),
  );
  serviceLocator.registerFactory<BagDetailsBloc>(
    () => BagDetailsBloc(repository: serviceLocator()),
  );
  serviceLocator.registerFactory<TicketsBloc>(
    () => TicketsBloc(repository: serviceLocator()),
  );
  serviceLocator.registerFactory<TicketBloc>(
    () => TicketBloc(repository: serviceLocator()),
  );
}
