import 'package:equatable/equatable.dart';

class ExpectedBagCountState extends Equatable {
  final int bagCount;

  const ExpectedBagCountState({required this.bagCount});

  ExpectedBagCountState copyWith({int? bagCount}) {
    return ExpectedBagCountState(bagCount: bagCount ?? this.bagCount);
  }

  @override
  List<Object?> get props => [bagCount];
}
