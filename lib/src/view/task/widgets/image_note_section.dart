import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_farm/src/view/task/widgets/image_picker_section.dart';

class ImageNoteSection extends StatelessWidget {
  final List<File> images;
  final Function(File) onImageAdded;
  final Function(File) onImageRemoved;
  final TextEditingController noteController;
  final bool isDisabled;
  final String notePlaceholder;
  final String imageURL;

  const ImageNoteSection({
    super.key,
    required this.images,
    required this.onImageAdded,
    required this.onImageRemoved,
    required this.noteController,
    this.isDisabled = false,
    this.notePlaceholder = 'Nhập ghi chú (nếu có)...',
    this.imageURL = '',
  });

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Xem chi tiết ảnh',
                style: TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 3.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Không thể tải hình ảnh.',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isNoteEmpty = noteController.text.trim().isEmpty;
    final bool hasImageURL = imageURL.isNotEmpty;

    return Column(
      children: [
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ghi chú bổ sung',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (isDisabled && isNoteEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Text(
                      'Không có ghi chú nào được thêm vào.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                else
                  TextFormField(
                    controller: noteController,
                    maxLines: 3,
                    enabled: !isDisabled,
                    decoration: InputDecoration(
                      hintText: notePlaceholder,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: isDisabled ? Colors.grey[100] : Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Hình ảnh',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (isDisabled)
                  hasImageURL
                      ? GestureDetector(
                          onTap: () => _showFullScreenImage(context, imageURL),
                          child: Column(
                            children: [
                              Container(
                                height: 200, // Kích thước cố định
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    imageURL,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text(
                                          'Không thể tải hình ảnh.',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Nhấn vào ảnh để xem chi tiết',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: const Text(
                            'Không có hình ảnh nào được đính kèm.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                else
                  hasImageURL
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _showFullScreenImage(context, imageURL),
                              child: Container(
                                height: 200, // Kích thước cố định
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    imageURL,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text(
                                          'Không thể tải hình ảnh.',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Nhấn vào ảnh để xem chi tiết',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(),
                            const SizedBox(height: 8),
                            const Text(
                              'Thêm ảnh mới:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ImagePickerSection(
                              images: images,
                              onImageAdded: onImageAdded,
                              onImageRemoved: onImageRemoved,
                              isDisabled: isDisabled,
                            ),
                          ],
                        )
                      : ImagePickerSection(
                          images: images,
                          onImageAdded: onImageAdded,
                          onImageRemoved: onImageRemoved,
                          isDisabled: isDisabled,
                        ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
