import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_bloc.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_event.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_state.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/widget/dropoff_location_card.dart';
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
        appBar: AppPrimaryAppBar(title: "Select Recycling Center"),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: BlocBuilder<DropOffBloc, DropOffState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LcHeader(title: "Select Recycling Center"),

                    // const Text(
                    //   "Nearby Locations",
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
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

                    /// LIST VIEW (Clickable)
                    if (state.status == DropOffStatus.success)
                      ...state.locations.map(
                        (location) => GestureDetector(
                          onTap: () {
                            AppNav.push(
                              context,
                              "/bagdrop",
                              extra: location.id, // 👉 pass full location model
                            );
                          },
                          child: DropOffLocationCard(
                            location: location,
                            onNavigate:
                                () {}, // not needed now but kept for compatibility
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
