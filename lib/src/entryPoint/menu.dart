// import 'rive_model.dart';

// class Menu {
//   final String title;
//   final RiveModel rive;

//   Menu({required this.title, required this.rive});
// }

// List<Menu> bottomNavItems = [
//   // Menu(
//   //   title: "Chat",
//   //   rive: RiveModel(
//   //     src: "assets/RiveAssets/icons.riv",
//   //     artboard: "CHAT",
//   //     stateMachineName: "CHAT_Interactivity",
//   //   ),
//   // ),
//   Menu(
//     title: "Home",
//     rive: RiveModel(
//       src: "assets/RiveAssets/icons.riv",
//       artboard: "HOME",
//       stateMachineName: "HOME_interactivity",
//     ),
//   ),
//   Menu(
//     title: "Search",
//     rive: RiveModel(
//       src: "assets/RiveAssets/icons.riv",
//       artboard: "SEARCH",
//       stateMachineName: "SEARCH_Interactivity",
//     ),
//   ),
//   Menu(
//     title: "Timer",
//     rive: RiveModel(
//       src: "assets/RiveAssets/icons.riv",
//       artboard: "TIMER",
//       stateMachineName: "TIMER_Interactivity",
//     ),
//   ),
//   Menu(
//     title: "Notification",
//     rive: RiveModel(
//       src: "assets/RiveAssets/icons.riv",
//       artboard: "BELL",
//       stateMachineName: "BELL_Interactivity",
//     ),
//   ),
//   Menu(
//     title: "Profile",
//     rive: RiveModel(
//       src: "assets/RiveAssets/icons.riv",
//       artboard: "USER",
//       stateMachineName: "USER_Interactivity",
//     ),
//   ),
// ];
import 'package:flutter/material.dart';

class Menu {
  final String title;
  final IconData icon;

  Menu({required this.title, required this.icon});
}

List<Menu> bottomNavItems = [
  Menu(title: "Home", icon: Icons.home_rounded),
  Menu(title: "Appointment", icon: Icons.currency_exchange_sharp),
  Menu(title: "Communuty", icon: Icons.people_alt_sharp),
  Menu(title: "Gift", icon: Icons.wallet_giftcard_outlined),
  Menu(title: "Security", icon: Icons.person),
];
