import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/auth_repository.dart';
import 'package:cycleiq_saas_mobile/src/entryPoint/entry_point.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_bloc.dart';
import 'package:cycleiq_saas_mobile/src/login/screen/loginScreen.dart';
import 'package:cycleiq_saas_mobile/src/onboarding/screen/onBoarding.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register/screen/register_screen.dart';
import 'package:cycleiq_saas_mobile/src/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const Showcase();
      },
    ),
    GoRoute(
      path: '/loginScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (_) =>
              LoginBloc(authRepository: serviceLocator<AuthRepository>()),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return BlocProvider(
          create: (_) =>
              RegisterBloc(authRepository: serviceLocator<AuthRepository>()),
          child: const RegisterScreen(),
        );
      },
    ),
    GoRoute(
      path: '/entryPoint',
      builder: (BuildContext context, GoRouterState state) {
        return const EntryPoint();
      },
    ),
    // GoRoute(
    //   path: '/bottom-navbar',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final extra = state.extra as Map<String, dynamic>?;
    //     final initialIndex =
    //         extra != null ? extra['initialIndex'] as int? ?? 0 : 0;
    //     return BottomNavbar(initialIndex: initialIndex);
    //   },
    // ),
  ],
);
