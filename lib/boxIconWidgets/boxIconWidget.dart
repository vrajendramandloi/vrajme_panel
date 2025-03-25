import 'package:flutter/material.dart';

class BoxIconWidget extends StatelessWidget {
  const BoxIconWidget({
    super.key,
    this.icon = Icons.document_scanner,
    required this.onPressed,
    required this.width,
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.isEnabled = true,
    this.borderRadius = 15.0,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double width;
  final Color iconColor;
  final Color? backgroundColor;
  final bool isEnabled;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final height = width * (4 / 3);
    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;
    final calculatedIconColor = isEnabled ? iconColor : Colors.grey[400];

    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: calculatedBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Icon(
            icon,
            size: width / 2,
            color: calculatedIconColor,
          ),
        ),
      ),
    );
  }
}
