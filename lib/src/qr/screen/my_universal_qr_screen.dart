import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/constants.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/qr/widget/qr_actions.dart';
import 'package:cycleiq_saas_mobile/src/qr/widget/qr_card.dart';
import 'package:cycleiq_saas_mobile/src/qr/widget/qr_header.dart';
import 'package:cycleiq_saas_mobile/src/qr/widget/qr_instructions.dart';
import 'package:flutter/material.dart';

class MyUniversalQRScreen extends StatefulWidget {
  const MyUniversalQRScreen({super.key});

  @override
  State<MyUniversalQRScreen> createState() => _MyUniversalQRScreenState();
}

class _MyUniversalQRScreenState extends State<MyUniversalQRScreen> {
  final pref = serviceLocator<PreferencesUtil>();
  String? userId;
  @override
  void initState() {
    userId = pref.getPreferencesData(Constants.preCustomerIdKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1FC58E), Color(0xFF26AEE7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  QRHeader(userId: userId),
                  SizedBox(height: 20),
                  QRCard(userId: userId),
                  SizedBox(height: 30),
                  QRActions(),
                  SizedBox(height: 30),
                  QRInstructions(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return BlocProvider(
    //   create: (_) =>
    //       QRBloc(QRRepositoryImpl(QRRemoteDataSourceImpl(serviceLocator())))
    //         ..add(FetchQRCodeEvent()),
    //   child: Scaffold(
    //     body: Stack(
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //             gradient: LinearGradient(
    //               colors: [Color(0xFF1FC58E), Color(0xFF26AEE7)],
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //             ),
    //           ),
    //         ),
    //         SafeArea(
    //           child: SingleChildScrollView(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: Column(
    //               children: const [
    //                 SizedBox(height: 20),
    //                 QRHeader(),
    //                 SizedBox(height: 20),
    //                 QRCard(),
    //                 SizedBox(height: 30),
    //                 QRActions(),
    //                 SizedBox(height: 30),
    //                 QRInstructions(),
    //                 SizedBox(height: 40),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
