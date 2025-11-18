import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/src/home/bloc/home_bloc.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_bloc.dart';

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
}
