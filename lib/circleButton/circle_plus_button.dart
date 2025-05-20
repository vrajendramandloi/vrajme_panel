import 'package:flutter/material.dart';

class CirclePlusButton extends StatelessWidget {
  const CirclePlusButton({
    super.key,
    this.onPressed,
    this.radius = 25.0,
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.padding = 5.0,
    this.isEnabled = true, // Add isEnabled property
  });

  final VoidCallback? onPressed;  // Make onPressed nullable
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
        onPressed: isEnabled ? onPressed : null, // Disable onPressed if not enabled
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(padding),
          backgroundColor: calculatedBackgroundColor,
          fixedSize: Size(2 * radius + 2 * padding,
              2 * radius + 2 * padding) // Set fixed size here
        ),
        child: Icon(
          Icons.add,
          size: radius,
          color: calculatedIconColor, // Use calculated icon color
        ),
      ),
    );
  }
}

