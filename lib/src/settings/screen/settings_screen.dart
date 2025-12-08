import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/settings/widgets/reward_tag.dart';
import 'package:cycleiq_saas_mobile/src/settings/widgets/section_title.dart';
import 'package:cycleiq_saas_mobile/src/settings/widgets/settings_card.dart';
import 'package:cycleiq_saas_mobile/src/settings/widgets/settings_header.dart';
import 'package:cycleiq_saas_mobile/src/settings/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/navigation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeader(),
              const SizedBox(height: 20),

              const SectionTitle("ACCOUNT"),
              SettingsCard(
                items: [
                  SettingsItem(
                    icon: Icons.person_outline,
                    title: "Edit Profile",
                    onTap: () => AppNav.push(context, "/profile"),
                  ),
                  SettingsItem(
                    icon: Icons.group_add_outlined,
                    title: "Referral Program",
                    trailing: const RewardTag(),
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: "Notifications",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.account_balance_outlined,
                    title: "Bank Account",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.verified_outlined,
                    title: "Payment Verification",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const SectionTitle("CRV & EARNINGS"),
              SettingsCard(
                items: [
                  SettingsItem(
                    icon: Icons.attach_money_outlined,
                    title: "CRV Summary",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.eco_outlined,
                    title: "Carbon Ledger",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const SectionTitle("HELP & SUPPORT"),
              SettingsCard(
                items: [
                  SettingsItem(
                    icon: Icons.menu_book_outlined,
                    title: "How It Works",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.warning_amber_outlined,
                    title: "CRV Limits",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.backpack_outlined,
                    title: "Bag & Drop Off Limits",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.info_outline,
                    title: "How Bag & Drop Program Works",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.headset_mic_outlined,
                    title: "Support & Disputes",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const SectionTitle("LEGAL"),
              SettingsCard(
                items: [
                  SettingsItem(
                    icon: Icons.description_outlined,
                    title: "Terms of Service",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// LOGOUT BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    final pref = serviceLocator<PreferencesUtil>();
                    pref.clearPreferencesData();
                    // Navigate back to SplashScreen
                    if (context.mounted) {
                      context.pushReplacement('/');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.shade200),
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "CycleIQ SuperApp v1.0.0",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Made with 💚 for the planet",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
