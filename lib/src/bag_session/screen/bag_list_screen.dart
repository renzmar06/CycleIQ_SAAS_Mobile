import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/bloc/bag_bloc.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/bloc/bag_event.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/bloc/bag_state.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/widget/bag_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagListScreen extends StatelessWidget {
  final String userId;
  const BagListScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          BagBloc(repository: serviceLocator<BagDetailsRepository>())
            ..add(LoadBagsEvent(userId)),
      child: Scaffold(
        appBar: AppPrimaryAppBar(title: "My Bags"),

        body: BlocBuilder<BagBloc, BagState>(
          builder: (context, state) {
            switch (state.status) {
              case BagStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case BagStatus.failure:
                return Center(child: Text(state.error ?? "Error"));

              case BagStatus.success:
                if (state.bags.isEmpty) {
                  return const Center(
                    child: Text(
                      "No bags registered.",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.bags.length,
                  itemBuilder: (_, i) {
                    return BagCard(bag: state.bags[i]);
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
