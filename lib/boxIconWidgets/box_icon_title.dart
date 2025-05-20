// ignore: file_names
import 'package:flutter/material.dart';

class BoxIconTitle extends StatelessWidget {
  const BoxIconTitle({
    super.key,
    this.icon = Icons.document_scanner,
    this.text = "Title",
    required this.onPressed,
    required this.width,
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.isEnabled = true,
    this.borderRadius = 15.0, // Add borderRadius property
  });

  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final Color iconColor;
  final Color? backgroundColor;
  final Color textColor;
  final bool isEnabled;
  final double borderRadius; // Add borderRadius property

  @override
  Widget build(BuildContext context) {
    final height = width * (4 / 3);
    final padding = width / 12;
    final textScaleFactor = width / 75.0;

    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;
    final calculatedIconColor = isEnabled ? iconColor : Colors.grey[400];
    final calculatedTextColor = isEnabled ? textColor : Colors.grey[400];

    return InkWell(
      onTap: isEnabled ? onPressed : null,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius), // Use borderRadius
                ),
                padding: EdgeInsets.all(padding),
                backgroundColor: calculatedBackgroundColor,
                fixedSize: Size(width, width), // Use width for both dimensions
              ),
              child: Icon(
                icon,
                size: width - (2 * padding), // Adjust icon size based on padding
                color: calculatedIconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: padding / 2),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: calculatedTextColor,
                  fontSize: 14 * textScaleFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
