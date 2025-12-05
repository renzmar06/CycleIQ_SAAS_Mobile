import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/bloc/expected_bag_count_bloc.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/widget/ebc_continue_button.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/widget/ebc_header.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/widget/ebc_important_note.dart';
import 'package:cycleiq_saas_mobile/src/expected_bag_count/widget/ebc_main_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpectedBagCountScreen extends StatelessWidget {
  const ExpectedBagCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpectedBagCountBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            children: [
              const EBCHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: const [
                      EBCMainCard(),
                      SizedBox(height: 20),
                      EBCImportantNote(),
                    ],
                  ),
                ),
              ),
              EBCContinueButton(
                onContinue: () {
                  final count = context
                      .read<ExpectedBagCountBloc>()
                      .state
                      .bagCount;
                  debugPrint("USER SELECTED BAG COUNT: $count");
                  AppNav.push(context, '/legal-certification');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
