import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vrajme_panel/utils/common_utils.dart';

class FileDisplayTile extends StatelessWidget {
  final PlatformFile file;
  final VoidCallback? onDelete; // Optional callback for a delete button

  const FileDisplayTile({
    super.key,
    required this.file,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      elevation: 2,
      child: ListTile(
        leading: CommonUtils.buildFileIcon(file.extension),
        title: Text(
          file.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          CommonUtils.formatBytes(file.size), // Using our helper function
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              )
            : null,
        onTap: () {  },
      ),
    );
  }
}