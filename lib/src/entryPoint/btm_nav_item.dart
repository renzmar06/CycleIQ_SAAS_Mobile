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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: isSelected ? const EdgeInsets.all(8) : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 33, 193, 142)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBar(isActive: isSelected),
            const SizedBox(height: 6),
            AnimatedScale(
              scale: isSelected ? 1.15 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1 : 0.5,
                child: Icon(
                  icon,
                  size: 28,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
