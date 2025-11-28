import 'package:cycleiq_saas_mobile/src/rewards/widgets/daily_challenge_card.dart';
import 'package:cycleiq_saas_mobile/src/rewards/widgets/reward_actions_grid.dart';
import 'package:cycleiq_saas_mobile/src/rewards/widgets/reward_points_card.dart';
import 'package:cycleiq_saas_mobile/src/rewards/widgets/reward_tier_benefits.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---------------- HEADER ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal.withOpacity(0.80)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.emoji_events_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Rewards",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Bronze Tier",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  /// ---------------- POINTS CARD ----------------
                  SizedBox(height: 20),
                  RewardPointsCard(),
                ],
              ),
            ),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  /// ---------------- ACTION BUTTON GRID ----------------
                  const RewardActionsGrid(),

                  const SizedBox(height: 24),

                  /// ---------------- TIER BENEFITS ----------------
                  const RewardTierBenefits(),

                  const SizedBox(height: 24),

                  /// ---------------- DAILY CHALLENGE CARD ----------------
                  const DailyChallengeCard(),
                ],
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
