import 'dart:io';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_bloc.dart';
import 'package:cycleiq_saas_mobile/src/profile/bloc/profile_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EPProfilePhoto extends StatefulWidget {
  final String? imageUrl;

  const EPProfilePhoto({super.key, this.imageUrl});

  @override
  State<EPProfilePhoto> createState() => _EPProfilePhotoState();
}

class _EPProfilePhotoState extends State<EPProfilePhoto> {
  final ImagePicker _picker = ImagePicker();
  File? _localImage;
  bool _uploading = false;

  @override
  Widget build(BuildContext context) {
    final displayed = _localImage != null
        ? FileImage(_localImage!)
        : (widget.imageUrl != null && widget.imageUrl!.isNotEmpty
              ? NetworkImage(widget.imageUrl!) as ImageProvider
              : null);

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: displayed,
            child: displayed == null
                ? const Icon(Icons.person, size: 46, color: Colors.white70)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: GestureDetector(
              onTap: _showPickerOptions,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                child: _uploading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Cancel'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );

      if (picked == null) return;

      setState(() {
        _localImage = File(picked.path);
        _uploading = true;
      });

      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          picked.path,
          filename: picked.name,
        ),
      });

      context.read<ProfileBloc>().add(UploadProfileImageEvent(formData));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Image pick failed: $e')));
    } finally {
      if (mounted) {
        setState(() => _uploading = false);
      }
    }
  }
}
