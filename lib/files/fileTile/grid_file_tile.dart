import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            getFileIcon(),
            const SizedBox(height: 8),
            Text(
              file.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Truncate long file names
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              formatBytes(file.size),
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  getFileIcon() {
    if (file.extension != null &&
        (file.extension!.toLowerCase() == 'jpg' ||
            file.extension!.toLowerCase() == 'png' ||
            file.extension!.toLowerCase() == 'jpeg')) if (file.path != null) {
      // Check if path is available for image
      return Expanded(
        child: Image.file(
          File(file.path!),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const Icon(Icons.image, size: 40, color: Colors.blue);
    }
    else if (file.extension != null && (file.extension!.toLowerCase() == 'pdf'))
      return const Icon(Icons.picture_as_pdf, size: 40, color: Colors.red);
    else if (file.extension != null &&
        (file.extension!.toLowerCase() == 'doc' ||
            file.extension!.toLowerCase() == 'docx'))
      return const Icon(Icons.description, size: 40, color: Colors.blueAccent);
    else if (file.extension != null &&
        (file.extension!.toLowerCase() == 'mp4' ||
            file.extension!.toLowerCase() == 'mov'))
      return const Icon(Icons.video_library, size: 40, color: Colors.green);
    else
      return const Icon(Icons.insert_drive_file, size: 40, color: Colors.grey);
  }

  String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    var formattedValue = bytes / math.pow(1024, i);
    return '${formattedValue.toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
