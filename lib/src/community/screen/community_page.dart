// FILE: lib/src/community/community_page.dart
import 'package:cycleiq_saas_mobile/src/community/widget/community_feed.dart';
import 'package:cycleiq_saas_mobile/src/community/widget/highlight_cards.dart';
import 'package:cycleiq_saas_mobile/src/community/widget/impact_chart.dart';
import 'package:cycleiq_saas_mobile/src/community/widget/impact_rank_card.dart';
import 'package:cycleiq_saas_mobile/src/community/widget/impact_row.dart';
import 'package:cycleiq_saas_mobile/src/community/widget/user_card.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 8),
              _Header(),
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ImpactRow(),
                    SizedBox(height: 18),
                    HighlightCards(),
                    SizedBox(height: 18),
                    CommunityImpactChart(),
                    SizedBox(height: 18),
                    CommunityFeed(),
                  ],
                ),
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF2ECC71), Color(0xFF1ABC9C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.groups, color: Colors.white, size: 32),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Community",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Together we make a difference",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18),
          UserCard(),
          SizedBox(height: 18),
          ImpactRankCard(),
        ],
      ),
    );
  }
}
