import 'dart:io';
import 'package:equatable/equatable.dart';
import '../model/material_item.dart';

enum BagDetailsStatus { initial, loading, success, failure }

class BagDetailsState extends Equatable {
  final List<MaterialItem> materials;
  final List<File> pickedImages;
  final File? pickedVideo;
  final String notes;
  final BagDetailsStatus status;
  final String? error;
  final String bagQrId;

  const BagDetailsState({
    this.materials = const [],
    this.pickedImages = const [],
    this.pickedVideo,
    this.notes = '',
    this.status = BagDetailsStatus.initial,
    this.error,
    this.bagQrId = '',
  });

  BagDetailsState copyWith({
    List<MaterialItem>? materials,
    List<File>? pickedImages,
    File? pickedVideo,
    String? notes,
    BagDetailsStatus? status,
    String? error,
    String? bagQrId,
  }) {
    return BagDetailsState(
      materials: materials ?? this.materials,
      pickedImages: pickedImages ?? this.pickedImages,
      pickedVideo: pickedVideo ?? this.pickedVideo,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      error: error,
      bagQrId: bagQrId ?? this.bagQrId,
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
  ];
}
