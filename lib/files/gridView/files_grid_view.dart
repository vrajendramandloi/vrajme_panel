import 'package:flutter/material.dart';
import 'package:vrajme_panel/files/fileTile/grid_file_tile.dart';

class FilesGridView extends StatelessWidget {
  final List<dynamic> files; // Can be XFile or PlatformFile
  final Function(dynamic) onFileTap;

  const FilesGridView({
    Key? key,
    required this.files,
    required this.onFileTap,
  }) : super(key: key);

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