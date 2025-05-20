import 'package:flutter/material.dart';

class CircleCameraButton extends StatelessWidget {
  const CircleCameraButton(
      {super.key,
      required this.onPressed,
      this.radius = 35.0,
      this.iconColor = Colors.white,
      this.backgroundColor = Colors.black,
      this.padding = 5.0,
      this.isEnabled = true});

  final VoidCallback onPressed;
  final double radius;
  final Color iconColor;
  final Color backgroundColor;
  final double padding;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final calculatedBackgroundColor = isEnabled
        ? backgroundColor
        : Colors.grey; // Grey background when disabled

    final calculatedIconColor = isEnabled
        ? iconColor
        : Colors.grey[400]; // Lighter grey icon when disabled

    return SizedBox(
      // SizedBox for the entire button, including padding
      width: 2 * (radius + padding),
      height: 2 * (radius + padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.all(padding),
            backgroundColor: calculatedBackgroundColor,
            fixedSize: Size(2 * radius + 2 * padding,
                2 * radius + 2 * padding) // Set fixed size here
            ),
        child: Icon(
          Icons.camera_alt,
          size: radius,
          color: calculatedIconColor,
        ),
      ),
    );
  }
}
