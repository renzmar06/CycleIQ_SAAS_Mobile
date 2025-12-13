import 'dart:io';
import 'package:equatable/equatable.dart';
import '../model/material_item.dart';

enum BagDetailsStatus { initial, loading, success, failure }

class AddBagDetailsState extends Equatable {
  final List<MaterialItem> materials;
  final List<File> pickedImages;
  final File? pickedVideo;
  final String notes;
  final BagDetailsStatus status;
  final String? error;
  final String bagQrId;
  final String message;

  const AddBagDetailsState({
    this.materials = const [],
    this.pickedImages = const [],
    this.pickedVideo,
    this.notes = '',
    this.status = BagDetailsStatus.initial,
    this.error,
    this.bagQrId = '',
    this.message = '',
  });

  AddBagDetailsState copyWith({
    List<MaterialItem>? materials,
    List<File>? pickedImages,
    File? pickedVideo,
    String? notes,
    BagDetailsStatus? status,
    String? error,
    String? bagQrId,
    String? message,
  }) {
    return AddBagDetailsState(
      materials: materials ?? this.materials,
      pickedImages: pickedImages ?? this.pickedImages,
      pickedVideo: pickedVideo ?? this.pickedVideo,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      error: error,
      bagQrId: bagQrId ?? this.bagQrId,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    materials,
    pickedImages,
    pickedVideo,
    notes,
    status,
    error,
    bagQrId,
    message,
  ];
}
