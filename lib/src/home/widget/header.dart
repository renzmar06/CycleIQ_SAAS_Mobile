import 'package:cycleiq_saas_mobile/src/home/widget/show_my_qr.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
                    const Column(
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
                            Text(
                              "ID: Not assigned",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
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
                    AppNav.push(context, "/my-qr");
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
