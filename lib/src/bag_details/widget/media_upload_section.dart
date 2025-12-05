import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnImagePicked = Future<void> Function(File file);
typedef OnRemoveImage = void Function(int index);
typedef OnVideoPicked = Future<void> Function(File file);
typedef OnRemoveVideo = void Function();

class MediaUploadSection extends StatefulWidget {
  final List<File> currentImages;
  final File? currentVideo;
  final OnImagePicked onImagePicked;
  final OnRemoveImage onRemoveImage;
  final OnVideoPicked onVideoPicked;
  final OnRemoveVideo onRemoveVideo;

  const MediaUploadSection({
    super.key,
    required this.currentImages,
    required this.currentVideo,
    required this.onImagePicked,
    required this.onRemoveImage,
    required this.onVideoPicked,
    required this.onRemoveVideo,
  });

  @override
  State<MediaUploadSection> createState() => _MediaUploadSectionState();
}

class _MediaUploadSectionState extends State<MediaUploadSection> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? x = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (x != null) {
      final f = File(x.path);
      await widget.onImagePicked(f);
    }
  }

  Future<void> _pickVideo() async {
    final XFile? x = await _picker.pickVideo(source: ImageSource.gallery);
    if (x != null) {
      final f = File(x.path);
      await widget.onVideoPicked(f);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos & Video',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            // Pick image button
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Icon(Icons.add_a_photo, color: Colors.green),
              ),
            ),
            // Display picked images
            for (int i = 0; i < widget.currentImages.length; i++)
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: FileImage(widget.currentImages[i]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => widget.onRemoveImage(i),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 12),
        // Video section
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _pickVideo,
                icon: const Icon(Icons.videocam),
                label: const Text('Add Video'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),

            if (widget.currentVideo != null) ...[
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.videocam, color: Colors.black54),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.currentVideo!.path
                            .split(Platform.pathSeparator)
                            .last,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onRemoveVideo,
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
