import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_bags_event.dart';
import 'register_bags_state.dart';

class RegisterBagsBloc extends Bloc<RegisterBagsEvent, RegisterBagsState> {
  RegisterBagsBloc() : super(const RegisterBagsState()) {
    on<ScanBagEvent>((event, emit) {
      if (!state.bags.contains(event.bagCode)) {
        emit(state.copyWith(bags: [...state.bags, event.bagCode]));
      }
    });
  }
}
