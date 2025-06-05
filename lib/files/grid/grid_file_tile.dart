import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vrajme_panel/utils/common_utils.dart';


class GridFilesTile extends StatelessWidget {
  final PlatformFile file; // Can be XFile or PlatformFile
  final Function(PlatformFile) onTap;

  const GridFilesTile({
    super.key,
    required this.file,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonUtils.buildFileIcon(file.extension),
            const SizedBox(height: 8),
            Text(
              file.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Truncate long file names
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              CommonUtils.formatBytes(file.size),
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
