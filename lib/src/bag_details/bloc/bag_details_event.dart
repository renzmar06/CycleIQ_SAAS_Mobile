import 'dart:io';
import '../model/material_item.dart';

abstract class BagDetailsEvent {}

class LoadInitialMaterials extends BagDetailsEvent {
  final List<MaterialItem> items;
  LoadInitialMaterials(this.items);
}

class UpdateMaterialWeight extends BagDetailsEvent {
  final int index;
  final double weight;
  UpdateMaterialWeight(this.index, this.weight);
}

class AddImageFile extends BagDetailsEvent {
  final File file;
  AddImageFile(this.file);
}

class RemoveImageAt extends BagDetailsEvent {
  final int index;
  RemoveImageAt(this.index);
}

class SetVideoFile extends BagDetailsEvent {
  final File file;
  SetVideoFile(this.file);
}

class RemoveVideo extends BagDetailsEvent {}

class SetNotes extends BagDetailsEvent {
  final String notes;
  SetNotes(this.notes);
}

class SubmitBagDetails extends BagDetailsEvent {
  SubmitBagDetails();
}

class SetBagQrId extends BagDetailsEvent {
  final String bagQrId;
  SetBagQrId(this.bagQrId);
}
