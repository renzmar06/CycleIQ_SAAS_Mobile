import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/constants.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/home/widget/show_my_qr.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final pref = serviceLocator<PreferencesUtil>();
  String? userId;

  @override
  void initState() {
    userId = pref.getPreferencesData(Constants.preCustomerIdKey);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// LEFT SIDE (User info)
              GestureDetector(
                onTap: () => AppNav.push(context, "/profile"),
                child: Row(
                  children: [
                    // User Icon
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => AppNav.to(context, "/profile"),
                    //   child: CircleAvatar(
                    //     radius: 26,
                    //     backgroundColor: Colors.grey.shade200,
                    //     backgroundImage: const AssetImage(
                    //       "assets/images/profileIcon.png",
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(width: 12),

                    // Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                                userId != null || userId!.isNotEmpty
                                    ? "ID: $userId"
                                    : "ID: Not assigned",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.copy, color: Colors.white70, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// RIGHT SIDE ICON BUTTONS
              Row(
                children: [
                  _headerIconButton(Icons.qr_code, () {
                    AppNav.push(context, "/qr-screen");
                  }),
                  const SizedBox(width: 10),
                  _headerIconButton(Icons.notifications_none, () {
                    AppNav.push(context, "/notifications");
                  }),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          ShowMyQRCard(), // <-- Add here
        ],
      ),
    );
  }

  Widget _headerIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
