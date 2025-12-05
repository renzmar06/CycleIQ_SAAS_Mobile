import 'package:flutter_bloc/flutter_bloc.dart';
import 'expected_bag_count_event.dart';
import 'expected_bag_count_state.dart';

class ExpectedBagCountBloc
    extends Bloc<ExpectedBagCountEvent, ExpectedBagCountState> {
  ExpectedBagCountBloc() : super(const ExpectedBagCountState(bagCount: 0)) {
    on<SetBagCountEvent>((event, emit) {
      emit(state.copyWith(bagCount: event.count));
    });

    on<IncrementBagCountEvent>((event, emit) {
      emit(state.copyWith(bagCount: state.bagCount + 1));
    });

    on<DecrementBagCountEvent>((event, emit) {
      if (state.bagCount > 0) {
        emit(state.copyWith(bagCount: state.bagCount - 1));
      }
    });
  }
}
