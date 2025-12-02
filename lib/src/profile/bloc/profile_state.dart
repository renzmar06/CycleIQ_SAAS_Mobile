import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final Map<String, dynamic> data;

  const UpdateProfileEvent(this.data);

  @override
  List<Object?> get props => [data];
}

class UploadProfileImageEvent extends ProfileEvent {
  final FormData file;

  const UploadProfileImageEvent(this.file);

  @override
  List<Object?> get props => [file];
}
