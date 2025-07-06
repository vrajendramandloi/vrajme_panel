import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerBottomSheet  {
  static void showFilePickerBottomSheet(
    BuildContext context,
    Function(List<File>?) onFilePicked
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Choose Media Type',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              _buildOptionTile(
                context,
                icon: Icons.image,
                title: 'Image',
                onTap: () async {
                  Navigator.pop(bc);
                  final ImagePicker picker = ImagePicker();
                  final List<XFile>? images = await picker.pickMultiImage();
                  List<File>? files = images?.map((file) => File(file.path!)).toList();
                  onFilePicked(files);
                }
              ),
              _buildOptionTile(
                context,
                icon: Icons.camera_alt,
                title: 'Take Photo',
                onTap: () async {
                  Navigator.pop(bc);
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage( source: ImageSource.camera );
                  onFilePicked(image != null ? [File(image.path)] : null);
                },
              ),
              _buildOptionTile(
                context,
                icon: Icons.video_library,
                title: 'Video',
                onTap: () async {
                  Navigator.pop(bc);
                  final ImagePicker picker = ImagePicker();
                  final List<XFile>? videos = await picker.pickMultipleMedia();
                  //  Convert List of XFile to  List of File
                  List<File>? files = videos?.map((file) => File(file.path!)).toList();
                  onFilePicked(files);
                },
              ),
              _buildOptionTile(
                context,
                icon: Icons.insert_drive_file,
                title: 'Document',
                onTap: () async {
                  Navigator.pop(bc);
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
                  );
                  List<File>? files = result?.files.map((file) => File(file.path!)).toList();
                  onFilePicked(files);
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOptionTile(BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 16.0)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
    );
  }
}