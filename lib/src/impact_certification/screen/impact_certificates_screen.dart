import 'package:cycleiq_saas_mobile/src/impact_certification/widgets/ic_donations_card.dart';
import 'package:cycleiq_saas_mobile/src/impact_certification/widgets/ic_header.dart';
import 'package:cycleiq_saas_mobile/src/impact_certification/widgets/ic_org_card.dart';
import 'package:cycleiq_saas_mobile/src/impact_certification/widgets/ic_personal_card.dart';
import 'package:cycleiq_saas_mobile/src/impact_certification/widgets/ic_tabs.dart';
import 'package:flutter/material.dart';

class ImpactCertificatesScreen extends StatefulWidget {
  const ImpactCertificatesScreen({super.key});

  @override
  State<ImpactCertificatesScreen> createState() =>
      _ImpactCertificatesScreenState();
}

class _ImpactCertificatesScreenState extends State<ImpactCertificatesScreen> {
  int selectedTab = 0; // 0=Personal, 1=Donations, 2=Org, 3=Sponsors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ICHeader(),

              // Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ICTabs(
                  selected: selectedTab,
                  onChange: (v) => setState(() => selectedTab = v),
                ),
              ),

              // Dynamic Sections
              if (selectedTab == 0) const ICPersonalCard(),
              if (selectedTab == 1) const ICDonationsCard(),
              if (selectedTab == 2) const ICOrgCard(),
              if (selectedTab == 3) const ICDonationsCard(), // same layout
            ],
          ),
        ),
      ),
    );
  }
}
