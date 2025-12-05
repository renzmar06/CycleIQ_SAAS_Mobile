import 'package:cycleiq_saas_mobile/src/bag_drop_limits/widget/info_benefits_box.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop_limits/widget/info_warning_box.dart';
import 'package:cycleiq_saas_mobile/src/bag_drop_limits/widget/limit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection_container_common.dart';
import '../bloc/bag_drop_limit_bloc.dart';
import '../bloc/bag_drop_limit_event.dart';
import '../bloc/bag_drop_limit_state.dart';

class BagDropLimitsScreen extends StatelessWidget {
  const BagDropLimitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          BagDropLimitBloc(repository: serviceLocator())
            ..add(LoadBagDropLimitsEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            children: [
              _header(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _topNotice(),
                      const SizedBox(height: 20),
                      _limitsTitle(),
                      const SizedBox(height: 10),
                      _limitsList(),
                      const SizedBox(height: 30),
                      const InfoWarningBox(),
                      const SizedBox(height: 20),
                      const InfoBenefitsBox(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------
  // HEADER
  // --------------------------
  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF17C37B), Color(0xFF0CA7E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            "Bag & Drop CRV Daily Allowable Limits",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------
  // TOP GREEN NOTICE
  // --------------------------
  Widget _topNotice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5FFF0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB8F7D0)),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "These limits apply ONLY to the Bag-Drop Program.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.green.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------
  // SECTION TITLE
  // --------------------------
  Widget _limitsTitle() {
    return const Text(
      "Daily Allowable Limits",
      style: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // --------------------------
  // LIMITS LIST (BLOC)
  // --------------------------
  Widget _limitsList() {
    return BlocBuilder<BagDropLimitBloc, BagDropLimitState>(
      builder: (context, state) {
        if (state.status == BagDropLimitStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BagDropLimitStatus.error) {
          return Center(child: Text(state.message ?? "Error loading limits"));
        }

        return Column(
          children: state.limits.map((item) {
            return LimitItem(
              data: {"name": item.name, "icon": item.icon, "limit": item.limit},
            );
          }).toList(),
        );
      },
    );
  }
}
