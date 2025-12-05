import 'package:cycleiq_saas_mobile/src/bag_details/widget/bag_id_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bag_details_bloc.dart';
import '../bloc/bag_details_event.dart';
import '../bloc/bag_details_state.dart';
import '../model/material_item.dart';

import '../widget/material_weight_row.dart';
import '../widget/media_upload_section.dart';
import '../widget/bag_notes_field.dart';

class BagDetailsScreen extends StatelessWidget {
  const BagDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BagDetailsBloc>().add(
      LoadInitialMaterials(_defaultMaterials()),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Bag Details"), backgroundColor: Colors.green),
      body: BlocConsumer<BagDetailsBloc, BagDetailsState>(
        listener: (context, state) {
          if (state.status == BagDetailsStatus.success) {
            Navigator.pop(context);
          }

          if (state.status == BagDetailsStatus.failure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔥 NEW: BAG QR ID TEXT FIELD
                SizedBox(height: 8),
                BagIdField(
                  initial: state.bagQrId,
                  onChanged: (value) =>
                      context.read<BagDetailsBloc>().add(SetBagQrId(value)),
                ),

                SizedBox(height: 20),

                _buildMaterialList(context, state),
                SizedBox(height: 20),

                MediaUploadSection(
                  currentImages: state.pickedImages,
                  currentVideo: state.pickedVideo,
                  onImagePicked: (file) async =>
                      context.read<BagDetailsBloc>().add(AddImageFile(file)),
                  onRemoveImage: (i) =>
                      context.read<BagDetailsBloc>().add(RemoveImageAt(i)),
                  onVideoPicked: (file) async =>
                      context.read<BagDetailsBloc>().add(SetVideoFile(file)),
                  onRemoveVideo: () =>
                      context.read<BagDetailsBloc>().add(RemoveVideo()),
                ),

                SizedBox(height: 20),

                BagNotesField(
                  initial: state.notes,
                  onChanged: (v) =>
                      context.read<BagDetailsBloc>().add(SetNotes(v)),
                ),

                SizedBox(height: 30),
                _submitButton(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMaterialList(BuildContext context, BagDetailsState state) {
    return Column(
      children: List.generate(state.materials.length, (index) {
        return MaterialWeightRow(
          item: state.materials[index],
          onChanged: (w) => context.read<BagDetailsBloc>().add(
            UpdateMaterialWeight(index, w.toDouble()),
          ),
        );
      }),
    );
  }

  Widget _submitButton(BuildContext context, BagDetailsState state) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: state.status == BagDetailsStatus.loading
            ? null
            : () {
                context.read<BagDetailsBloc>().add(SubmitBagDetails());
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state.status == BagDetailsStatus.loading
            ? CircularProgressIndicator(color: Colors.white)
            : Text("Submit Bag Details"),
      ),
    );
  }

  List<MaterialItem> _defaultMaterials() => [
    MaterialItem(name: "Plastic 1 (PETE)", weight: 0),
    MaterialItem(name: "Plastic 2 (HDPE)", weight: 0),
    MaterialItem(name: "Glass", weight: 0),
    MaterialItem(name: "Metal", weight: 0),
    MaterialItem(name: "Paper", weight: 0),
  ];
}
