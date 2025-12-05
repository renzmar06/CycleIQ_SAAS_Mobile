import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expected_bag_count_bloc.dart';
import '../bloc/expected_bag_count_event.dart';
import '../bloc/expected_bag_count_state.dart';

class EBCNumberPicker extends StatelessWidget {
  const EBCNumberPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpectedBagCountBloc, ExpectedBagCountState>(
      builder: (_, state) {
        return Container(
          // height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade400, width: 2),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "${state.bagCount}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  _arrowButton(
                    Icons.keyboard_arrow_up,
                    () => context.read<ExpectedBagCountBloc>().add(
                      IncrementBagCountEvent(),
                    ),
                  ),
                  _arrowButton(
                    Icons.keyboard_arrow_down,
                    () => context.read<ExpectedBagCountBloc>().add(
                      DecrementBagCountEvent(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(width: 40, height: 27, child: Icon(icon, size: 22)),
    );
  }
}
