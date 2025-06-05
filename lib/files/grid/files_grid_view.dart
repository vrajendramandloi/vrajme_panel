import 'package:flutter/material.dart';
import 'package:vrajme_panel/files/grid/grid_file_tile.dart';

class FilesGridView extends StatelessWidget {
  final List<dynamic> files; // Can be XFile or PlatformFile
  final Function(dynamic) onFileTap;

  const FilesGridView({
    super.key,
    required this.files,
    required this.onFileTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust as needed
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return GridFilesTile(
          file: file,
          onTap: onFileTap(file),
        );
      },
    );
  }
}