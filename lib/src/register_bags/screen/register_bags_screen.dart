import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_event.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/bloc/register_bags_state.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/screen/bag_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBagsScreen extends StatelessWidget {
  const RegisterBagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBagsBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            children: [
              _header(context),
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
  }

  // ---------------------------
  // HEADER
  // ---------------------------
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
            "Register Bags",
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

  // ---------------------------
  // BAGS COUNTER CARD
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
                state.bags.length.toString(),
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
  // SCAN BOX
  // ---------------------------
  Widget _scanBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      width: double.infinity,
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
            "Scan QR stickers inside each bag",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            "Make sure each bag has a unique QR sticker",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () async {
              final code = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BagScannerScreen()),
              );

              if (code != null) {
                context.read<RegisterBagsBloc>().add(ScanBagEvent(code));
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
  // LIST OF REGISTERED BAGS
  // ---------------------------
  Widget _registeredList() {
    return BlocBuilder<RegisterBagsBloc, RegisterBagsState>(
      builder: (context, state) {
        return Column(
          children: List.generate(state.bags.length, (index) {
            final bagId = state.bags[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                    child: Text(
                      "Bag #${index + 1}\n$bagId",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
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
                      "Registered",
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
            onTap: () => AppNav.push(context, '/bag-count'),
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF17C37B), Color(0xFF0CA7E5)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Continue (${state.bags.length} Bags)",
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
