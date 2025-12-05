import 'package:equatable/equatable.dart';

abstract class ExpectedBagCountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetBagCountEvent extends ExpectedBagCountEvent {
  final int count;

  SetBagCountEvent(this.count);

  @override
  List<Object?> get props => [count];
}

class IncrementBagCountEvent extends ExpectedBagCountEvent {}

class DecrementBagCountEvent extends ExpectedBagCountEvent {}
