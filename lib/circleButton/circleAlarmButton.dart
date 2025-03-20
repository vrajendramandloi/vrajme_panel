import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart'; // Import for Entypo

class CircleAlarmButton extends StatelessWidget {
  const CircleAlarmButton({
    super.key,
    this.onPressed,
    this.radius = 25.0, // Default radius. Adjust as needed
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.padding = 5.0, // Default padding
    this.isEnabled = true,
  });

  final VoidCallback? onPressed;
  final double radius;
  final Color iconColor;
  final Color? backgroundColor;
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
          Entypo.bell, // Using Entypo bell icon
          size: radius,
          color: calculatedIconColor,
        ),
      ),
    );
  }
}
