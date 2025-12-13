import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import '../model/bag_details_request.dart';
import '../model/material_item.dart';
import 'bag_details_event.dart';
import 'bag_details_state.dart';

class AddBagDetailsBloc extends Bloc<AddBagDetailsEvent, AddBagDetailsState> {
  final BagDetailsRepository repository;

  AddBagDetailsBloc({required this.repository})
    : super(const AddBagDetailsState()) {
    on<LoadInitialMaterials>((event, emit) {
      emit(state.copyWith(materials: event.items));
    });

    on<UpdateMaterialWeight>((event, emit) {
      final list = List<MaterialItem>.from(state.materials);
      list[event.index] = list[event.index].copyWith(weight: event.weight);
      emit(state.copyWith(materials: list));
    });

    on<AddImageFile>((event, emit) {
      emit(state.copyWith(pickedImages: [...state.pickedImages, event.file]));
    });

    on<RemoveImageAt>((event, emit) {
      final updated = List<File>.from(state.pickedImages)
        ..removeAt(event.index);
      emit(state.copyWith(pickedImages: updated));
    });

    on<SetVideoFile>((event, emit) {
      emit(state.copyWith(pickedVideo: event.file));
    });

    on<RemoveVideo>((event, emit) {
      emit(state.copyWith(pickedVideo: null));
    });

    on<SetNotes>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });
    on<SetBagQrId>((event, emit) {
      emit(state.copyWith(bagQrId: event.bagQrId));
    });

    on<SubmitBagDetails>(_submitBagDetails);
    on<ResetBagDetailsStatus>(_onResetStatus); // ✅
  }

  Future<void> _submitBagDetails(
    SubmitBagDetails event,
    Emitter<AddBagDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BagDetailsStatus.loading));
    try {
      final request = BagDetailsRequest(
        bagQrId: state.bagQrId,
        materials: state.materials,
        images: state.pickedImages.map((e) => e.path).toList(),
        videoFile: state.pickedVideo,
        notes: state.notes.isEmpty ? null : state.notes,
      );

      Map<String, dynamic> data = await repository.submitBagDetails(request);

      emit(
        state.copyWith(
          status: BagDetailsStatus.success,
          message: data['message'],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: BagDetailsStatus.failure, error: e.toString()),
      );
    }
  }

  void _onResetStatus(
    ResetBagDetailsStatus event,
    Emitter<AddBagDetailsState> emit,
  ) {
    emit(state.copyWith(status: BagDetailsStatus.initial, message: null));
  }
}
