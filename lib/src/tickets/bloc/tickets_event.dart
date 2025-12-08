import 'package:equatable/equatable.dart';

abstract class TicketsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTicketsEvent extends TicketsEvent {}

class RefreshTicketsEvent extends TicketsEvent {}
