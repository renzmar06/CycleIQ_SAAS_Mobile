import 'dart:io';
import '../model/material_item.dart';

abstract class AddBagDetailsEvent {}

class LoadInitialMaterials extends AddBagDetailsEvent {
  final List<MaterialItem> items;
  LoadInitialMaterials(this.items);
}

class UpdateMaterialWeight extends AddBagDetailsEvent {
  final int index;
  final double weight;
  UpdateMaterialWeight(this.index, this.weight);
}

class AddImageFile extends AddBagDetailsEvent {
  final File file;
  AddImageFile(this.file);
}

class RemoveImageAt extends AddBagDetailsEvent {
  final int index;
  RemoveImageAt(this.index);
}

class SetVideoFile extends AddBagDetailsEvent {
  final File file;
  SetVideoFile(this.file);
}

class RemoveVideo extends AddBagDetailsEvent {}

class SetNotes extends AddBagDetailsEvent {
  final String notes;
  SetNotes(this.notes);
}

class SubmitBagDetails extends AddBagDetailsEvent {
  SubmitBagDetails();
}

class SetBagQrId extends AddBagDetailsEvent {
  final String bagQrId;
  SetBagQrId(this.bagQrId);
}

class ResetBagDetailsStatus extends AddBagDetailsEvent {}
