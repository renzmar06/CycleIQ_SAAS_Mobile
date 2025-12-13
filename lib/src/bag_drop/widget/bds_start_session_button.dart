import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BDSStartSessionButton extends StatelessWidget {
  final String recyclingCenter;
  const BDSStartSessionButton({super.key, required this.recyclingCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Color(0xFF22C575), Color(0xFF1FB2CE)],
        // ),
      ),
      child: Column(
        children: [
          AppButton(
            text: "Start Bag-Drop Session",
            onPressed: () {
              AppNav.push(
                context,
                '/register-bag',
                extra: {'recyclingCenter': recyclingCenter},
              );
            },
          ),
          const SizedBox(height: 20),
          // GestureDetector(
          //   onTap: () => AppNav.push(context, '/bag-details'),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 18),
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [Color(0xFF22C575), Color(0xFF1FB2CE)],
          //       ),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "generate QR",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 17,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
