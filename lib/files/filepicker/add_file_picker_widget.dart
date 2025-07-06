import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vrajme_panel/files/filepicker/file_picker_bottomsheet.dart';


class AddFilePickerWidget extends StatelessWidget {
  final Function(List<File>?) onFilePicked;
  final String buttonText;
  
  const AddFilePickerWidget({
    Key? key,
    required this.onFilePicked,
    this.buttonText = 'Select File',
  }) : super(key: key);

  Widget _buildAddFileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, color: Colors.teal, size: 32),
            SizedBox(height: 8),
            Text('Add File', style: TextStyle(color: Colors.teal)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FilePickerBottomSheet.showFilePickerBottomSheet(context, onFilePicked),
      child: _buildAddFileButton()
    );
  }
}