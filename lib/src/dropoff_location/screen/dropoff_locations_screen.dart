import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_bloc.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_event.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_state.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/widget/dropoff_location_card.dart';
import 'package:cycleiq_saas_mobile/src/legal_certification/widget/lc_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropOffLocationsScreen extends StatelessWidget {
  const DropOffLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DropOffBloc(repository: serviceLocator())
            ..add(FetchDropOffLocations()),
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   leading: GestureDetector(
        //     onTap: () => AppNav.back(context),
        //     child: Container(
        //       padding: const EdgeInsets.all(8),
        //       decoration: BoxDecoration(
        //         color: Colors.black.withOpacity(0.15),
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //       child: const Icon(Icons.arrow_back, color: Colors.black),
        //     ),
        //   ),
        //   title: Text(
        //     "Legal Certification",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 22,
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: BlocBuilder<DropOffBloc, DropOffState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LcHeader(),
                    const Text(
                      "Nearby Locations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// LOADING
                    if (state.status == DropOffStatus.loading)
                      const Center(child: CircularProgressIndicator()),

                    /// ERROR
                    if (state.status == DropOffStatus.failure)
                      Text(
                        "Error: ${state.error}",
                        style: const TextStyle(color: Colors.red),
                      ),

                    /// LIST
                    if (state.status == DropOffStatus.success)
                      ...state.locations.map(
                        (e) =>
                            DropOffLocationCard(location: e, onNavigate: () {}),
                      ),

                    const SizedBox(height: 20),

                    /// BUTTON
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: const LinearGradient(
                            colors: [Color(0xff21c76c), Color(0xff1fa0c9)],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "I Dropped Off My Bags",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
