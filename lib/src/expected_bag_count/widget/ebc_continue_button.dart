import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expected_bag_count_state.dart';
import '../bloc/expected_bag_count_bloc.dart';

class EBCContinueButton extends StatelessWidget {
  final VoidCallback onContinue;

  const EBCContinueButton({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpectedBagCountBloc, ExpectedBagCountState>(
      builder: (_, state) {
        return GestureDetector(
          onTap: onContinue,
          child: Container(
            height: 58,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00C27C), Color(0xFF00A7E1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Continue",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
