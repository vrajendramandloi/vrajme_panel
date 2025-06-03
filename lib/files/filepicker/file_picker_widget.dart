import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerWidget extends StatelessWidget {
  final Function(FilePickerResult?) onFilePicked;
  final Function(XFile?) onImagePicked; // For image_picker results
  final String buttonText;

  const FilePickerWidget({
    Key? key,
    required this.onFilePicked,
    required this.onImagePicked,
    this.buttonText = 'Select File',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showFilePickerBottomSheet(context, onFilePicked, onImagePicked),
      child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade200
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Select and Upload Files ..!  "),
                  Icon(Icons.cloud_upload_rounded, color: Colors.blue,)
                ],
              ),
            ),
    );
  }
}

void _showFilePickerBottomSheet(
  BuildContext context,
  Function(FilePickerResult?) onFilePicked,
  Function(XFile?) onImagePicked,
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
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                onImagePicked(image);
              }
            ),
            _buildOptionTile(
              context,
              icon: Icons.camera_alt,
              title: 'Take Photo',
              onTap: () async {
                Navigator.pop(bc);
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera
                );
                onImagePicked(image);
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.video_library,
              title: 'Video',
              onTap: () async {
                Navigator.pop(bc);
                final ImagePicker picker = ImagePicker();
                final XFile? video = await picker.pickVideo(source: ImageSource.gallery, );
                onImagePicked(video);
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
                onFilePicked(result);
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      );
    },
  );
}

Widget _buildOptionTile(BuildContext context, {
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