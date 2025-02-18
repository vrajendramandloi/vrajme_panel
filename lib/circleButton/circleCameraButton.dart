import 'package:flutter/material.dart';

class CircleCameraButton extends StatelessWidget {
  const CircleCameraButton({
    super.key,
    required this.onPressed,
    this.radius = 35.0,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.padding = 5.0,
  });

  final VoidCallback onPressed;
  final double radius;
  final Color iconColor;
  final Color backgroundColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox( // SizedBox for the entire button, including padding
      width: 2 * (radius + padding),
      height: 2 * (radius + padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(padding),
          backgroundColor: backgroundColor,
        ),
        child: Icon(
            Icons.camera_alt,
            size: radius,
            color: iconColor,
          ),
      ),
    );
  }
}
