import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/constants.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_popup.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/src/add_bag_details/widget/bag_id_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bag_details_bloc.dart';
import '../bloc/bag_details_event.dart';
import '../bloc/bag_details_state.dart';
import '../model/material_item.dart';

import '../widget/material_weight_row.dart';
import '../widget/media_upload_section.dart';
import '../widget/bag_notes_field.dart';

class AddBagDetailsScreen extends StatefulWidget {
  const AddBagDetailsScreen({super.key});

  @override
  State<AddBagDetailsScreen> createState() => _AddBagDetailsScreenState();
}

class _AddBagDetailsScreenState extends State<AddBagDetailsScreen> {
  final pref = serviceLocator<PreferencesUtil>();
  String? userId;

  @override
  void initState() {
    super.initState();
    userId = pref.getPreferencesData(Constants.preCustomerIdKey);

    /// Load default materials
    context.read<AddBagDetailsBloc>().add(
      LoadInitialMaterials(_defaultMaterials()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPrimaryAppBar(
        title: "Add Bag Details",
        actions: [
          GestureDetector(
            onTap: () {
              AppNav.push(context, "/my-bags?userId=$userId");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.list_alt, color: Colors.white, size: 20),
                  SizedBox(width: 6),
                  Text(
                    "Registered Bags",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: BlocConsumer<AddBagDetailsBloc, AddBagDetailsState>(
        listener: (context, state) {
          if (state.status == BagDetailsStatus.success) {
            AppNav.pop(context);
            // ✅ reset AFTER UI reaction
            context.read<AddBagDetailsBloc>().add(ResetBagDetailsStatus());
            AppPopup.showSuccess(context, state.message);
          }

          if (state.status == BagDetailsStatus.failure) {
            AppPopup.showError(
              context,
              state.error ?? 'Something went wrong please try after some time',
            );
            // ✅ reset AFTER UI reaction
            context.read<AddBagDetailsBloc>().add(ResetBagDetailsStatus());
          }
        },

        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                /// Bag QR ID
                BagIdField(
                  initial: state.bagQrId,
                  onChanged: (value) =>
                      context.read<AddBagDetailsBloc>().add(SetBagQrId(value)),
                ),

                const SizedBox(height: 20),

                _buildMaterialList(context, state),
                const SizedBox(height: 20),

                MediaUploadSection(
                  currentImages: state.pickedImages,
                  currentVideo: state.pickedVideo,
                  onImagePicked: (file) async =>
                      context.read<AddBagDetailsBloc>().add(AddImageFile(file)),
                  onRemoveImage: (i) =>
                      context.read<AddBagDetailsBloc>().add(RemoveImageAt(i)),
                  onVideoPicked: (file) async =>
                      context.read<AddBagDetailsBloc>().add(SetVideoFile(file)),
                  onRemoveVideo: () =>
                      context.read<AddBagDetailsBloc>().add(RemoveVideo()),
                ),

                const SizedBox(height: 20),

                BagNotesField(
                  initial: state.notes,
                  onChanged: (v) =>
                      context.read<AddBagDetailsBloc>().add(SetNotes(v)),
                ),

                const SizedBox(height: 30),

                _submitButton(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMaterialList(BuildContext context, AddBagDetailsState state) {
    return Column(
      children: List.generate(state.materials.length, (index) {
        return MaterialWeightRow(
          item: state.materials[index],
          onChanged: (value) => context.read<AddBagDetailsBloc>().add(
            UpdateMaterialWeight(index, value.toDouble()),
          ),
        );
      }),
    );
  }

  /// ---------------------------------------------------------
  /// ✅ SUBMIT BUTTON WITH VALIDATION LOGIC
  /// ---------------------------------------------------------
  Widget _submitButton(BuildContext context, AddBagDetailsState state) {
    final hasMaterial = state.materials.any((item) => (item.weight > 0));
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed:
            state.status == BagDetailsStatus.loading ||
                state.bagQrId.trim().isEmpty ||
                state.pickedImages.isEmpty ||
                !hasMaterial
            ? null
            : () => _validateAndSubmit(context, state),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              state.bagQrId.trim().isNotEmpty &&
                  state.pickedImages.isNotEmpty &&
                  hasMaterial
              ? Colors.green
              : Colors.green.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child:
            state.status == BagDetailsStatus.loading &&
                state.bagQrId.trim().isNotEmpty &&
                state.pickedImages.isNotEmpty
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Submit Bag Details",
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }

  /// ---------------------------------------------------------
  /// 🔥 VALIDATION FUNCTION
  /// ---------------------------------------------------------
  void _validateAndSubmit(BuildContext context, AddBagDetailsState state) {
    // 1️⃣ Bag QR ID Required
    // if (state.bagQrId.trim().isEmpty) {
    //   AppPopup.showError(context, "Bag QR ID is required");
    //   return;
    // }

    // 2️⃣ At least one material must have weight > 0
    // final hasMaterial = state.materials.any((item) => (item.weight > 0));

    // if (!hasMaterial) {
    //   AppPopup.showError(
    //     context,
    //     "Please add weight for at least one material",
    //   );
    //   return;
    // }

    // 3️⃣ At least one image required
    // if (state.pickedImages.isEmpty) {
    //   AppPopup.showError(context, "Please upload at least one image");
    //   return;
    // }

    // 4️⃣ Submit to bloc
    context.read<AddBagDetailsBloc>().add(SubmitBagDetails());
  }

  List<MaterialItem> _defaultMaterials() => [
    MaterialItem(name: "Plastic 1 (PETE)", weight: 0),
    MaterialItem(name: "Plastic 2 (HDPE)", weight: 0),
    MaterialItem(name: "Glass", weight: 0),
    MaterialItem(name: "Metal", weight: 0),
    MaterialItem(name: "Paper", weight: 0),
  ];
}
