import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart'; // For Entypo icons

class CirclePinButton extends StatelessWidget {
  const CirclePinButton({
    super.key,
    required this.onPressed,
    this.radius = 25.0,
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.padding = 5.0,
  });

  final VoidCallback onPressed;
  final double radius;
  final Color iconColor;
  final Color? backgroundColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Entypo.location_pin,  // Pin icon (using Entypo)
          size: radius,
          color: iconColor,
        ),
      ),
    );
  }
}
