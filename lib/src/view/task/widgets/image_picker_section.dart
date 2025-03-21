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

  Future<void> _pickImageFromGallery(BuildContext context) async {
    if (isDisabled) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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
      child: Card.outlined(
        child: SizedBox(
          width: 110,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: onTap == null
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
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
          'Tập tin đính kèm',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        if (images.isEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImagePickerButton(
                context: context,
                icon: LinearIcons.cameraIcon,
                label: 'Chụp ảnh',
                onTap: isDisabled ? null : () => _pickImageFromCamera(context),
              ),
              _buildImagePickerButton(
                context: context,
                icon: LinearIcons.folderAddIcon,
                label: 'Chọn tập tin',
                onTap: isDisabled ? null : () => _pickImageFromGallery(context),
              ),
            ],
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
