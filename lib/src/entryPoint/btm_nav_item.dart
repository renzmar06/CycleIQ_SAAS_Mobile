// import 'package:cycleiq_saas_mobile/src/entryPoint/menu.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// import 'animated_bar.dart';

// class BtmNavItem extends StatelessWidget {
//   const BtmNavItem({
//     super.key,
//     required this.navBar,
//     required this.press,
//     required this.riveOnInit,
//     required this.selectedNav,
//   });

//   final Menu navBar;
//   final VoidCallback press;
//   final ValueChanged<Artboard> riveOnInit;
//   final Menu selectedNav;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnimatedBar(isActive: selectedNav == navBar),
//           SizedBox(
//             height: 36,
//             width: 36,
//             child: Opacity(
//               opacity: selectedNav == navBar ? 1 : 0.5,
//               child: RiveAnimation.asset(
//                 navBar.rive.src,
//                 artboard: navBar.rive.artboard,
//                 onInit: riveOnInit,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'animated_bar.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: isSelected),
          const SizedBox(height: 6),
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.white : Colors.white54,
          ),
        ],
      ),
    );
  }
}
