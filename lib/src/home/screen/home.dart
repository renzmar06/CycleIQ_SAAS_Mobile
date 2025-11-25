import 'package:cycleiq_saas_mobile/src/home/widget/active_bonuses.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/daily_streak.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/header.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/quick_actions.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/wallet_summary.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scale values similar to your previous code, but simplified
    final size = MediaQuery.of(context).size;
    final scale = (size.width / 400).clamp(0.9, 1.3);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20 * scale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 20),
              WalletSummary(),
              SizedBox(height: 20),
              QuickActionsGrid(),
              SizedBox(height: 20),
              DailyStreak(),
              SizedBox(height: 20),
              ActiveBonuses(),
            ],
          ),
        ),
      ),
    );
  }
}
