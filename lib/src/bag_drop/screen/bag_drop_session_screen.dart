import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop/widget/bds_center_card.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop/widget/bds_crv_limits_button.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop/widget/bds_start_session_button.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop/widget/bds_step_card.dart';
import 'package:flutter/material.dart';

class BagDropSessionScreen extends StatelessWidget {
  final String recyclingCenter;
  const BagDropSessionScreen({super.key, required this.recyclingCenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPrimaryAppBar(title: "Bag-Drop Session"),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // const BDSHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const BDSCenterCard(),
                    const SizedBox(height: 30),

                    const Text(
                      "How It Works",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const BDSStepCard(
                      number: "1.",
                      title: "Register Your Bags",
                      subtitle: "Scan QR stickers inside each bag",
                      icon: Icons.qr_code_scanner,
                      color: Color(0xFFE0EBFF),
                      iconColor: Colors.blue,
                    ),

                    const SizedBox(height: 12),

                    const BDSStepCard(
                      number: "2.",
                      title: "Drop Off at Location",
                      subtitle: "Find nearest drop-off point",
                      icon: Icons.location_on_outlined,
                      color: Color(0xFFFFE4C7),
                      iconColor: Colors.orange,
                    ),

                    const SizedBox(height: 12),

                    const BDSStepCard(
                      number: "3.",
                      title: "Get Paid",
                      subtitle: "Receive payout after processing",
                      icon: Icons.attach_money_rounded,
                      color: Color(0xFFDFFFE3),
                      iconColor: Colors.green,
                    ),

                    const SizedBox(height: 20),
                    const BDSCRVLimitsButton(),
                    const SizedBox(height: 20),
                    BDSStartSessionButton(recyclingCenter: recyclingCenter),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
