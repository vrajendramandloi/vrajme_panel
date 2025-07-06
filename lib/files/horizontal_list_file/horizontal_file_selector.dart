import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vrajme_panel/files/filepicker/add_file_picker_widget.dart';

class HorizontalFileSelector extends StatelessWidget {
  final List<File>? files;
  final Function(int) onRemoveFile;
  final Function(List<File>?) onFilePicked;

  const HorizontalFileSelector({
    super.key,
    required this.files,
    required this.onRemoveFile,
    required this.onFilePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10.0),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: files!.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return AddFilePickerWidget(
              onFilePicked: onFilePicked,
            );
          }
          final fileIndex = index - 1;
          return _buildFileItem(files![fileIndex], fileIndex);
        },
      ),
    );
  }

  /// Builds the widget for a single selected file.
  Widget _buildFileItem(File file, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        // Use a Stack to overlay the remove button on top of the file item.
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.teal.withOpacity(0.5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.insert_drive_file, color: Colors.teal, size: 32),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    file.absolute.path.split('/').last,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          // This is the remove button.
          Positioned(
            top: -8,
            right: -8,
            child: GestureDetector(
              onTap: () => onRemoveFile(index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}