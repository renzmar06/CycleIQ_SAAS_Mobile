import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_popup.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/app_primary_appbar.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/primary_button.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/ep_personal_info_form.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/ep_profile_photo.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/ep_recycling_impact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection_container_common.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<EPPersonalInfoFormState>();

    return BlocProvider(
      create: (_) =>
          ProfileBloc(profileRepository: serviceLocator())
            ..add(FetchProfileEvent()),
      child: Scaffold(
        appBar: AppPrimaryAppBar(title: "Edit Profile"),
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state.status == ProfileStatus.updateSuccess) {
                AppNav.pop(context);
                AppPopup.showSuccess(context, "Profile updated!");
              }
              if (state.status == ProfileStatus.failure) {
                AppNav.pop(context);
                AppPopup.showError(context, state.errorMessage ?? '');
              }
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state.status == ProfileStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final user = state.user;
                if (user == null) return const SizedBox();

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      EPProfilePhoto(imageUrl: user.idProofImage),
                      const SizedBox(height: 30),

                      EPRecyclingImpact(
                        kgCo2Saved: user.kgCo2Saved,
                        totalBags: user.totalBags,
                        totalEarned: user.totalEarned,
                      ),
                      const SizedBox(height: 30),

                      EPPersonalInfoForm(user: user, formKey: formKey),
                      const SizedBox(height: 20),

                      AppButton(
                        height: 58,
                        text: "Submit",
                        loading: state.status == ProfileStatus.loading,
                        onPressed: () {
                          final formData = formKey.currentState?.formValues;
                          if (formData != null) {
                            context.read<ProfileBloc>().add(
                              UpdateProfileEvent(formData),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
