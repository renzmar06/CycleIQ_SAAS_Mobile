import 'package:cycleiq_saas_mobile/src/home/widget/categories_grid.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/eco_stats.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/header.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/ongoing_pickup_card.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/quick_actions.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 25),
              HomeSearchBar(),
              SizedBox(height: 30),
              QuickActionsSection(),
              SizedBox(height: 35),
              CategoriesGrid(),
              SizedBox(height: 35),
              OngoingPickupCard(),
              SizedBox(height: 30),
              EcoStats(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
