import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';

class ImagePickerSection extends StatelessWidget {
  final List<File> images;
  final Function(File) onImageAdded;
  final Function(File) onImageRemoved;
  final bool isDisabled;

  const ImagePickerSection({
    super.key,
    required this.images,
    required this.onImageAdded,
    required this.onImageRemoved,
    this.isDisabled = false,
  });

  Future<void> _pickImageFromCamera(BuildContext context) async {
    if (isDisabled) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      onImageAdded(File(pickedFile.path));
    }
  }

  Widget _buildImagePickerButton({
    required BuildContext context,
    required Widget icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      // child: Card.outlined(
      //   child: SizedBox(
      //     width: 110,
      //     height: 90,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         icon,
      //         const SizedBox(height: 8),
      //         Text(
      //           label,
      //           style: TextStyle(
      //             color: onTap == null
      //                 ? Theme.of(context).colorScheme.outline
      //                 : Theme.of(context).colorScheme.onSurface,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(Icons.add_photo_alternate_outlined,
                size: 40, color: Colors.grey[400]),
            const SizedBox(height: 12),
            Text('Thêm hình ảnh', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hình ảnh đính kèm',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        if (images.isEmpty)
          Center(
            child: _buildImagePickerButton(
              context: context,
              icon: LinearIcons.cameraIcon,
              label: 'Chụp ảnh',
              onTap: isDisabled ? null : () => _pickImageFromCamera(context),
            ),
          ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: images.map((image) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                if (!isDisabled)
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () => onImageRemoved(image),
                    ),
                  ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
