import 'package:equatable/equatable.dart';

abstract class BagDropLimitEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBagDropLimitsEvent extends BagDropLimitEvent {}
