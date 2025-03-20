import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
  });

  final IconData icon;
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust radius as needed
      ),
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(confirmText),
        ),
      ],
    );
  }
}
