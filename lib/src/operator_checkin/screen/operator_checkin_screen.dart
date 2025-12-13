import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_center_popup.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_popup.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/checkin_bloc.dart';
import '../bloc/checkin_event.dart';
import '../bloc/checkin_state.dart';

class OperatorCheckInScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const OperatorCheckInScreen({super.key, required this.data});

  @override
  State<OperatorCheckInScreen> createState() => _OperatorCheckInScreenState();
}

class _OperatorCheckInScreenState extends State<OperatorCheckInScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckInBloc, CheckInState>(
      listener: (context, state) {
        if (state.status == CheckInStatus.success) {
          if (!context.mounted) return;
          AppCenterPopup.show(
            context,
            title: "Submit Session",
            message: "Session has been created\n ID:${state.bagQrId}",
          );

          Future.delayed(const Duration(seconds: 2), () {
            AppNav.back(context);
            if (context.mounted) {
              AppNav.go(context, '/entryPoint');
            }
          });
        }

        if (state.status == CheckInStatus.failure) {
          AppPopup.showError(context, state.message!);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F7FA),
        appBar: AppPrimaryAppBar(title: "Check-In"),
        body: Column(
          children: [
            // _tabs(),
            Expanded(child: selectedTab == 0 ? _operatorTab() : _selfTab()),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------
  // TOP TABS
  // ------------------------------------------
  Widget _tabs() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: const Color(0xFF17C37B),
      child: Row(
        children: [
          _tabButton("Operator", 0),
          const SizedBox(width: 12),
          _tabButton("Self Check-In", 1),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------
  // OPERATOR CHECK-IN TAB CONTENT
  // ------------------------------------------
  Widget _operatorTab() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Icon(Icons.person, size: 60, color: Colors.blue),
          const SizedBox(height: 10),
          const Text(
            "Operator Check-In",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),
          const Text(
            "Ask the operator to scan one of your bags\nto check in your entire session",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          GestureDetector(
            onTap: () async {
              final scannedQr = "BAG-001"; // Replace with actual scanner result
              context.read<CheckInBloc>().add(ScanOperatorBagEvent(scannedQr));
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 70,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox(height: 40),

          BlocBuilder<CheckInBloc, CheckInState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: AppButton(
                  height: 58,
                  text: "Submit Session",
                  loading: state.status == CheckInStatus.loading,
                  onPressed: () {
                    final mergedData = {
                      ...widget.data,
                      "isOperatorCheckIn": true,
                      "status": "pending",
                    };

                    context.read<CheckInBloc>().add(
                      SubmitOperatorCheckInEvent(mergedData),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ------------------------------------------
  // SELF CHECK-IN TAB
  // ------------------------------------------
  Widget _selfTab() {
    return const Center(child: Text("Self Check-In Coming Soon"));
  }
}
