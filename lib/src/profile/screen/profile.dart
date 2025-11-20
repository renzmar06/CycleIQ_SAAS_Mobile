import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_bloc.dart';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_event.dart';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_state.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/edit_profile_sheet.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/logout_button.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/profile_avatar.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/profile_header.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/profile_info_tile.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/profile_section_title.dart';
import 'package:cycleiq_saas_mobile/src/profile/widget/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();

  late ProfileBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = serviceLocator<ProfileBloc>();
    bloc.add(const LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? "Something went wrong")),
            );
          }
        },
        builder: (context, state) {
          if (state.status == ProfileStatus.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final user = state.user;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// HEADER
                  ProfileHeader(
                    name: user?.name ?? "Guest",
                    email: user?.email ?? "",
                  ),
                  const SizedBox(height: 20),

                  /// AVATAR
                  ProfileAvatar(
                    avatarUrl: user?.avatarUrl,
                    onEdit: () {
                      _showEditSheet(context);
                    },
                  ),
                  const SizedBox(height: 30),

                  /// ACCOUNT INFO
                  const ProfileSectionTitle("Account Info"),
                  ProfileInfoTile(label: "Name", value: user?.name ?? ""),
                  ProfileInfoTile(label: "Email", value: user?.email ?? ""),
                  ProfileInfoTile(label: "Phone", value: user?.phone ?? ""),

                  const SizedBox(height: 30),

                  /// SETTINGS
                  const ProfileSectionTitle("Settings"),

                  const SettingsTile(
                    icon: Icons.lock_outline,
                    title: "Change Password",
                  ),
                  const SettingsTile(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                  ),
                  const SettingsTile(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                  ),
                  const SettingsTile(
                    icon: Icons.help_outline,
                    title: "Help & Support",
                  ),

                  const SizedBox(height: 40),

                  /// LOGOUT
                  LogoutButton(
                    onLogout: () => bloc.add(const LogoutProfileEvent()),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => EditProfileSheet(
        nameCtrl: _nameCtrl,
        phoneCtrl: _phoneCtrl,
        onSave: () {
          bloc.add(
            UpdateProfileEvent(
              name: _nameCtrl.text.trim(),
              phone: _phoneCtrl.text.trim(),
              avatarPathOrUrl: null,
            ),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
