import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vrajme_panel/files/list/file_display_tile.dart';

class FileListViewer extends StatelessWidget {
  final List<PlatformFile> files;
  final Function(int index)? onFileDeleted; // Callback to handle deletion

  const FileListViewer({
    Key? key,
    required this.files,
    this.onFileDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const Center(
        child: Text(
          'No files selected yet.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true, // Make ListView take only the space it needs
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return FileDisplayTile(
          file: file,
          onDelete: onFileDeleted != null
              ? () => onFileDeleted!(index)
              : null,
        );
      },
    );
  }
}