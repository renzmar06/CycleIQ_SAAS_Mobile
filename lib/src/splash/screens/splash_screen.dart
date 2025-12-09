import 'dart:async';
import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/constants.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final Map<String, dynamic>?
  extra; // Properly declare extra as a named parameter

  const SplashScreen({super.key, this.extra}); // Correct constructor

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // FirebaseMessaging.instance.getAPNSToken().then((String? apnsToken) {
    //   debugPrint("APNSToken:>>> $apnsToken");
    // });
    // FirebaseMessaging.instance.getToken().then((String? fcmToken) {
    //   debugPrint("FirebaseToken:>>> $fcmToken");
    //   final pref = serviceLocator<PreferencesUtil>();
    //   pref.setPreferencesData(Constants.fcmToken, fcmToken);
    //   final isLoggedIn = pref.getBoolPreferencesData(Constants.prefIsLoggedIn);
    // if (isLoggedIn) {
    //   context.read<LoginCubit>().updateFcmToken(fcmToken);
    // }
    // });
    // Determine duration based on extra parameter
    final duration =
        widget.extra != null && widget.extra!.containsKey('duration')
        ? widget.extra!['duration'] as int
        : 4000; // Default to 4000ms (4 seconds)

    Timer(Duration(milliseconds: duration), () {
      final pref = serviceLocator<PreferencesUtil>();
      final prefShowHome = pref.getBoolPreferencesData(
        Constants.prefIsLoggedIn,
      );
      if (prefShowHome) {
        AppNav.go(context, '/entryPoint', extra: {'initialIndex': 0});
      } else {
        // AppNav.go(context, '/entryPoint', extra: {'initialIndex': 0});
        AppNav.go(context, '/onboarding');
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(ImageStrings.splashBgImage),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lotties/Recycle.json',
                  height: 180,
                  width: 180,
                  fit: BoxFit.contain,
                ),
                Image.asset(ImageStrings.logoTransparent, height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
