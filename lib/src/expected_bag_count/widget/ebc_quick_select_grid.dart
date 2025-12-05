import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expected_bag_count_bloc.dart';
import '../bloc/expected_bag_count_event.dart';

class EBCQuickSelectGrid extends StatelessWidget {
  const EBCQuickSelectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final quickOptions = [1, 2, 3, 4, 5, 6, 8, 10];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quickOptions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.3,
      ),
      itemBuilder: (_, index) {
        final value = quickOptions[index];
        return GestureDetector(
          onTap: () =>
              context.read<ExpectedBagCountBloc>().add(SetBagCountEvent(value)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade400, width: 2),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
