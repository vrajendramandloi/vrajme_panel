import 'package:flutter/material.dart';

class CircleIconTitle extends StatelessWidget {
  const CircleIconTitle({
    super.key,
    this.icon = Icons.document_scanner,
    this.text = "Title",
    required this.onPressed,
    required this.width,
    this.iconColor = Colors.white,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.isEnabled = true, // Add isEnabled property
  });

  final IconData icon;
  final String text;
  final VoidCallback? onPressed; // Make onPressed nullable
  final double width;
  final Color iconColor;
  final Color? backgroundColor;
  final Color textColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final height = width * (4 / 3);
    final radius = width / 2;
    final padding = width / 12;
    final textScaleFactor = width / 75.0;

    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;
    final calculatedIconColor = isEnabled ? iconColor : Colors.grey[400];
    final calculatedTextColor = isEnabled ? textColor : Colors.grey[400];



    return InkWell(
      onTap: isEnabled ? onPressed : null, // Disable InkWell if not enabled
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: isEnabled ? onPressed : null,  // Disable button if not enabled
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.all(padding),
                backgroundColor: calculatedBackgroundColor,
                fixedSize: Size(2 * radius, 2 * radius),
              ),
              child: Icon(
                icon,
                size: radius - padding,
                color: calculatedIconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: padding / 2),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: calculatedTextColor, // Use calculated text color
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

