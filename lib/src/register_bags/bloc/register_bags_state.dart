import 'package:equatable/equatable.dart';

class RegisterBagsState extends Equatable {
  final List<String> bags;

  const RegisterBagsState({this.bags = const []});

  RegisterBagsState copyWith({List<String>? bags}) {
    return RegisterBagsState(bags: bags ?? this.bags);
  }

  @override
  List<Object?> get props => [bags];
}
