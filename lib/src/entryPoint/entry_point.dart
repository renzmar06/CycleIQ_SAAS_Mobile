// import 'package:cycleiq_saas_mobile/core/utils/constants/colors.dart';
// import 'package:cycleiq_saas_mobile/core/utils/rive_utils.dart';
// import 'package:cycleiq_saas_mobile/src/entryPoint/btm_nav_item.dart';
// import 'package:cycleiq_saas_mobile/src/entryPoint/menu.dart';
// import 'package:cycleiq_saas_mobile/src/home/screen/home.dart';
// import 'package:cycleiq_saas_mobile/src/profile/screen/profile.dart';
// import 'package:flutter/material.dart';

// /// NOTE: Replace these placeholder imports with your real page widgets.
// // import 'package:cycleiq_saas_mobile/src/home/home_screen.dart';
// // import 'package:cycleiq_saas_mobile/src/orders/orders_screen.dart';
// // import 'package:cycleiq_saas_mobile/src/notifications/notifications_screen.dart';
// // import 'package:cycleiq_saas_mobile/src/profile/profile_screen.dart';

// class EntryPoint extends StatefulWidget {
//   const EntryPoint({super.key});

//   @override
//   State<EntryPoint> createState() => _EntryPointState();
// }

// class _EntryPointState extends State<EntryPoint>
//     with SingleTickerProviderStateMixin {
//   // track the selected index, default to first item
//   int _selectedIndex = 0;

//   // keep the same Menu selected variable if other code uses it
//   Menu selectedBottonNav = bottomNavItems.first;

//   late AnimationController _animationController;
//   late Animation<double> scalAnimation;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     _animationController =
//         AnimationController(
//           vsync: this,
//           duration: const Duration(milliseconds: 200),
//         )..addListener(() {
//           setState(() {});
//         });

//     scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//     animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   /// List of pages that correspond (in order) to bottomNavItems.
//   /// Replace the placeholder pages with your actual screens.
//   final List<Widget> _pages = const [
//     HomeScreen(),
//     HomeScreen(),
//     HomeScreen(),
//     ProfileScreen(),
//     ProfileScreen(),
//   ];

//   // update selection by index
//   void _updateSelectedIndex(int index) {
//     if (_selectedIndex != index) {
//       setState(() {
//         _selectedIndex = index;
//         selectedBottonNav = bottomNavItems[index];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       resizeToAvoidBottomInset: false,
//       backgroundColor: backgroundColor2,
//       // show the selected page (IndexedStack preserves state)
//       body: IndexedStack(index: _selectedIndex, children: _pages),

//       bottomNavigationBar: Transform.translate(
//         offset: Offset(0, 100 * animation.value),
//         child: SafeArea(
//           child: Container(
//             padding: const EdgeInsets.only(
//               left: 12,
//               top: 12,
//               right: 12,
//               bottom: 12,
//             ),
//             margin: const EdgeInsets.symmetric(horizontal: 24),
//             decoration: BoxDecoration(
//               color: backgroundColor2.withOpacity(0.8),
//               borderRadius: const BorderRadius.all(Radius.circular(24)),
//               boxShadow: [
//                 BoxShadow(
//                   color: backgroundColor2.withOpacity(0.3),
//                   offset: const Offset(0, 20),
//                   blurRadius: 20,
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // create a nav item for each bottomNavItems entry
//                 ...List.generate(bottomNavItems.length, (index) {
//                   final Menu navBar = bottomNavItems[index];
//                   return BtmNavItem(
//                     navBar: navBar,
//                     press: () {
//                       // change rive state + update selected page
//                       RiveUtils.chnageSMIBoolState(navBar.rive.status!);
//                       _updateSelectedIndex(index);
//                     },
//                     riveOnInit: (artboard) {
//                       navBar.rive.status = RiveUtils.getRiveInput(
//                         artboard,
//                         stateMachineName: navBar.rive.stateMachineName,
//                       );
//                     },
//                     selectedNav: selectedBottonNav,
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cycleiq_saas_mobile/src/appointment/screen/appointment_screen.dart';
import 'package:cycleiq_saas_mobile/src/community/screen/community_page.dart';
import 'package:cycleiq_saas_mobile/src/home/screen/home.dart';
import 'package:cycleiq_saas_mobile/src/rewards/screen/rewards_screen.dart';
import 'package:cycleiq_saas_mobile/src/settings/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:cycleiq_saas_mobile/src/entryPoint/menu.dart';
import 'package:cycleiq_saas_mobile/src/entryPoint/btm_nav_item.dart';
import 'package:cycleiq_saas_mobile/core/utils/constants/colors.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AppointmentScreen(),
    CommunityPage(),
    RewardsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),

            boxShadow: [
              BoxShadow(
                color: backgroundColor2.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomNavItems.length,
              (i) => BtmNavItem(
                icon: bottomNavItems[i].icon,
                isSelected: _selectedIndex == i,
                onTap: () {
                  setState(() {
                    _selectedIndex = i;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
