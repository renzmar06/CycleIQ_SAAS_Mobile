import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_event.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_state.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/screen/bag_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBagsScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const RegisterBagsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBagsBloc(repository: serviceLocator()),
      child: Builder(
        builder: (context) {
          return BlocListener<RegisterBagsBloc, RegisterBagsState>(
            listener: (context, state) {
              if (state.status == RegisterBagStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message ?? "Bag registered"),
                    backgroundColor: Colors.green,
                  ),
                );
              }

              if (state.status == RegisterBagStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message ?? "Error"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },

            child: Scaffold(
              appBar: AppPrimaryAppBar(title: "Register Bags"),

              backgroundColor: Colors.grey.shade100,

              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _bagsCounter(),
                            const SizedBox(height: 20),
                            _scanBox(context),
                            const SizedBox(height: 30),

                            const Text(
                              "Registered Bags",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 12),

                            _registeredList(),

                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),

                    _continueButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------------------
  // BAG COUNTER UI
  // ---------------------------
  Widget _bagsCounter() {
    return BlocBuilder<RegisterBagsBloc, RegisterBagsState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF17C37B), Color(0xFF2ED298)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bags Registered",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              Text(
                state.registeredBags.length.toString(),
                style: const TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------------------------
  // SCAN BOX UI
  // ---------------------------
  Widget _scanBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.qr_code_scanner, color: Colors.blue, size: 55),
          const SizedBox(height: 10),
          const Text(
            "Scan QR sticker inside the bag",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            "Each bag must have a unique QR code",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 18),

          GestureDetector(
            onTap: () async {
              final scanned = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const QRScannerDialog(),
              );

              if (scanned != null) {
                context.read<RegisterBagsBloc>().add(ScanBagEvent(scanned));
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Scan Bag QR",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // REGISTERED BAGS LIST UI
  // ---------------------------
  Widget _registeredList() {
    return BlocBuilder<RegisterBagsBloc, RegisterBagsState>(
      builder: (context, state) {
        if (state.registeredBags.isEmpty) {
          return const Text(
            "No bags scanned yet",
            style: TextStyle(color: Colors.grey),
          );
        }

        return Column(
          children: List.generate(state.registeredBags.length, (index) {
            final bag = state.registeredBags[index];

            return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),

              child: Row(
                children: [
                  const Icon(Icons.inventory_2, color: Colors.green, size: 28),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bag QR: ${bag.bagQrId}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "ID: ${bag.id}",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8FFF1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Verified",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  // ---------------------------
  // CONTINUE BUTTON
  // ---------------------------
  Widget _continueButton() {
    return BlocBuilder<RegisterBagsBloc, RegisterBagsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(18),
          child: GestureDetector(
            onTap: state.registeredBags.isNotEmpty
                ? () {
                    final mergedData = {
                      ...data,
                      "bags": state.registeredBags
                          .map((b) => {"bagId": b.id})
                          .toList(),
                    };
                    AppNav.push(
                      context,
                      '/legal-certification',
                      extra: mergedData,
                    );
                  }
                : null,
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                color: state.registeredBags.isNotEmpty
                    ? Colors.green
                    : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Continue (${state.registeredBags.length} Bags)",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
