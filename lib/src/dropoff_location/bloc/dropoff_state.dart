import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';

enum DropOffStatus { initial, loading, success, failure }

class DropOffState {
  final DropOffStatus status;
  final List<DropOffLocation> locations;
  final String? error;

  DropOffState({
    this.status = DropOffStatus.initial,
    this.locations = const [],
    this.error,
  });

  DropOffState copyWith({
    DropOffStatus? status,
    List<DropOffLocation>? locations,
    String? error,
  }) {
    return DropOffState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      error: error,
    );
  }
}
