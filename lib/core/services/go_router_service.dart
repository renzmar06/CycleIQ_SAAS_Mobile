import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/auth_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/ticket_repository.dart';
import 'package:cycleiq_saas_mobile/src/add_bag_details/bloc/bag_details_bloc.dart';
import 'package:cycleiq_saas_mobile/src/add_bag_details/screen/bag_details_screen.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/screen/bag_details_screen.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop/screen/bag_drop_session_screen.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop_limits/screen/bag_drop_limits_screen.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/screen/bag_list_screen.dart';
import 'package:cycleiq_saas_mobile/src/category/screen/category_screen.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_bloc.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/screen/dropoff_locations_screen.dart';
import 'package:cycleiq_saas_mobile/src/entryPoint/entry_point.dart';
import 'package:cycleiq_saas_mobile/src/home/screen/home.dart';
import 'package:cycleiq_saas_mobile/src/impact_certification/screen/impact_certificates_screen.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/bloc/legal_cert_bloc.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/screen/legal_certification_screen.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_bloc.dart';
import 'package:cycleiq_saas_mobile/src/login/screen/loginScreen.dart';
import 'package:cycleiq_saas_mobile/src/onboarding/screen/onBoarding.dart';
import 'package:cycleiq_saas_mobile/src/operator_checkin/bloc/checkin_bloc.dart';
import 'package:cycleiq_saas_mobile/src/operator_checkin/screen/operator_checkin_screen.dart';
import 'package:cycleiq_saas_mobile/src/pickup_status/screen/pickup_status_screen.dart';
import 'package:cycleiq_saas_mobile/src/profile/screen/profile.dart';
import 'package:cycleiq_saas_mobile/src/qr/screen/my_universal_qr_screen.dart';
import 'package:cycleiq_saas_mobile/src/recycling_centers/screen/recycling_centers_screen.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register/screen/register_screen.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/screen/register_bags_screen.dart';
import 'package:cycleiq_saas_mobile/src/splash/screens/splash_screen.dart';
import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/bloc/ticket_bloc.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/screen/ticket_details_screen.dart';
import 'package:cycleiq_saas_mobile/src/track_pick_up/screen/track_pickup_screen.dart';
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
    GoRoute(
      path: '/homeScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: "/bagdrop",
      builder: (context, state) {
        final location = state.extra as String;

        return BagDropSessionScreen(recyclingCenter: location);
      },
    ),

    GoRoute(
      path: "/pickup-track",
      builder: (_, _) => const TrackPickupScreen(),
    ),
    GoRoute(
      path: "/centers",
      builder: (_, _) => const RecyclingCentersScreen(),
    ),
    GoRoute(
      path: '/category/:name',
      builder: (context, state) {
        // read path param safely (works for modern go_router)
        final raw = state.pathParameters['name'] ?? '';
        final name = raw.isNotEmpty ? Uri.decodeComponent(raw) : 'Unknown';

        return CategoryScreen(categoryName: name);
      },
    ),
    GoRoute(
      path: "/pickup-status",
      builder: (_, _) => const PickupStatusScreen(),
    ),
    GoRoute(path: "/qr-screen", builder: (_, _) => const MyUniversalQRScreen()),
    GoRoute(
      path: "/bag-drop-limit",
      builder: (_, _) => const BagDropLimitsScreen(),
    ),
    GoRoute(
      path: "/register-bag",
      builder: (context, state) {
        log("hsbhbsd${state.extra}");
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (_) =>
              RegisterBagsBloc(repository: serviceLocator<DropOffRepository>()),
          child: RegisterBagsScreen(data: data),
        );
      },
    ),
    GoRoute(
      path: "/checkInScreen",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (_) =>
              CheckInBloc(repository: serviceLocator<DropOffRepository>()),
          child: OperatorCheckInScreen(data: data),
        );
      },
    ),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
    // NO NEED
    // GoRoute(
    //   path: "/bag-count",
    //   builder: (context, state) {
    //     return BlocProvider(
    //       create: (_) => ExpectedBagCountBloc(),
    //       child: const ExpectedBagCountScreen(),
    //     );
    //   },
    // ),
    GoRoute(
      path: "/legal-certification",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (_) => LegalCertBloc(),
          child: LegalCertificationScreen(data: data),
        );
      },
    ),
    GoRoute(
      path: "/drop-off-location",
      builder: (context, state) {
        return BlocProvider(
          create: (_) =>
              DropOffBloc(repository: serviceLocator<DropOffRepository>()),
          child: const DropOffLocationsScreen(),
        );
      },
    ),
    GoRoute(
      path: '/bag-details',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => AddBagDetailsBloc(
            repository: serviceLocator<BagDetailsRepository>(),
          ),
          child: AddBagDetailsScreen(),
        );
      },
    ),

    GoRoute(
      path: '/ticket-details',
      builder: (context, state) {
        final ticket = state.extra as TicketModel; // ✅ receiving full model

        return BlocProvider(
          create: (_) => TicketBloc(
            repository: serviceLocator<TicketRepository>(),
          ), // ✅ preload ticket
          child: TicketDetailsScreen(ticket: ticket),
        );
      },
    ),

    GoRoute(
      path: "/impact-certificate",
      builder: (_, _) => const ImpactCertificatesScreen(),
    ),
    GoRoute(path: "/profile", builder: (_, _) => const EditProfileScreen()),
    GoRoute(
      path: "/my-bags",
      builder: (_, state) {
        final userId = state.uri.queryParameters["userId"]!;
        return BagListScreen(userId: userId);
      },
    ),

    GoRoute(
      path: '/bag-view',
      builder: (context, state) {
        final qrId = state.uri.queryParameters["qrId"]!;
        return BagDetailsViewScreen(qrId: qrId);
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
