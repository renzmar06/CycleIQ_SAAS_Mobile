import 'package:equatable/equatable.dart';

abstract class RegisterBagsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ScanBagEvent extends RegisterBagsEvent {
  final String bagCode;
  ScanBagEvent(this.bagCode);

  @override
  List<Object?> get props => [bagCode];
}
