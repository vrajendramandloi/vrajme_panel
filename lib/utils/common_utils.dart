import 'dart:math' as math;

import 'package:flutter/material.dart';

class CommonUtils {
  static String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    var formattedValue = bytes / math.pow(1024, i);
    return '${formattedValue.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static Widget buildFileIcon(String? extension) {
    IconData iconData;
    Color iconColor;

    if (extension == null) {
      iconData = Icons.insert_drive_file;
      iconColor = Colors.grey;
    } else {
      switch (extension.toLowerCase()) {
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
          iconData = Icons.image;
          iconColor = Colors.blue;
          break;
        case 'pdf':
          iconData = Icons.picture_as_pdf;
          iconColor = Colors.red;
          break;
        case 'doc':
        case 'docx':
          iconData = Icons.description;
          iconColor = Colors.blueAccent;
          break;
        case 'xls':
        case 'xlsx':
          iconData = Icons.table_chart;
          iconColor = Colors.green;
          break;
        case 'ppt':
        case 'pptx':
          iconData = Icons.slideshow;
          iconColor = Colors.orange;
          break;
        case 'zip':
        case 'rar':
          iconData = Icons.folder_zip;
          iconColor = Colors.purple;
          break;
        case 'mp3':
        case 'wav':
          iconData = Icons.audio_file;
          iconColor = Colors.brown;
          break;
        case 'mp4':
        case 'mov':
          iconData = Icons.video_file;
          iconColor = Colors.teal;
          break;
        default:
          iconData = Icons.insert_drive_file;
          iconColor = Colors.grey;
      }
    }
    return Icon(iconData, size: 30, color: iconColor);
  }

  /* static getFileIcon() {
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
  } */
}