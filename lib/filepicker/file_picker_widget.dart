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
    return InkWell( // Or ElevatedButton, GestureDetector, etc.
      onTap: () => _showFilePickerBottomSheet(context, onFilePicked, onImagePicked),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// --- 2. _showFilePickerBottomSheet Function ---
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
      return SafeArea( // Ensures content is not obscured by system UI
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make column only as tall as its children
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choose Media Type',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            // --- 3. Bottom Sheet Content (Options) ---
            _buildOptionTile(
              context,
              icon: Icons.image,
              title: 'Image',
              onTap: () async {
                Navigator.pop(bc); // Close the bottom sheet
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                onImagePicked(image); // Pass the picked image
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.camera_alt,
              title: 'Take Photo',
              onTap: () async {
                Navigator.pop(bc); // Close the bottom sheet
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.camera);
                onImagePicked(image); // Pass the picked image
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.video_library,
              title: 'Video',
              onTap: () async {
                Navigator.pop(bc); // Close the bottom sheet
                final ImagePicker picker = ImagePicker();
                final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
                onImagePicked(video); // image_picker also handles videos
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.insert_drive_file,
              title: 'Document',
              onTap: () async {
                Navigator.pop(bc); // Close the bottom sheet
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx', 'txt'], // Customize as needed
                );
                onFilePicked(result); // Pass the picked file result
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.folder,
              title: 'Any File',
              onTap: () async {
                Navigator.pop(bc); // Close the bottom sheet
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                onFilePicked(result); // Pass the picked file result
              },
            ),
            const SizedBox(height: 16.0), // Spacing at the bottom
          ],
        ),
      );
    },
  );
}

// Helper function to build consistent option tiles
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