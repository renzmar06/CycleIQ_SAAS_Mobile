import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/widget/lc_cert_box.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/widget/lc_checkbox_row.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/widget/lc_continue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/legal_cert_bloc.dart';
import '../bloc/legal_cert_event.dart';
import '../bloc/legal_cert_state.dart';

class LegalCertificationScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const LegalCertificationScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LegalCertBloc(),
      child: Scaffold(
        appBar: AppPrimaryAppBar(title: "Legal Certification"),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: BlocConsumer<LegalCertBloc, LegalCertState>(
            listener: (context, state) {
              if (state.success) {
                // AppNav.push(context, '/register-bag');
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LcCertBox(),

                    // Yellow certification text box
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E1),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Under penalty of perjury, I certify that:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "• My bag count and contents information is accurate.",
                          ),
                          SizedBox(height: 6),
                          Text(
                            "• I understand false information may lead to suspension.",
                          ),
                          SizedBox(height: 6),
                          Text("• All materials are sorted correctly."),
                          SizedBox(height: 6),
                          Text(
                            "• I accept responsibility for the contents of my bags.",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    LcCheckboxRow(
                      checked: state.isAgreed,
                      onChanged: (val) => context.read<LegalCertBloc>().add(
                        ToggleAgreementEvent(val),
                      ),
                    ),

                    LcContinueButton(
                      enabled: state.isAgreed,
                      loading: state.submitting,
                      onTap: () {
                        // context.read<LegalCertBloc>().add(
                        //   SubmitCertificationEvent(),
                        // );
                        final mergedData = {
                          ...data,
                          "isTermsAndConditionApproved": true,
                        };
                        AppNav.push(
                          context,
                          '/checkInScreen',
                          extra: mergedData,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
