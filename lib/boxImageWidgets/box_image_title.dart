import 'package:flutter/material.dart';

class BoxImageTitle extends StatelessWidget {
  const BoxImageTitle({
    super.key,
    this.image,
    this.defaultImage,
    this.onPressed,
    required this.width,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.isEnabled = true,
    this.text = "Title",
    this.borderRadius = 8.0,
  });

  final ImageProvider? image;
  final ImageProvider? defaultImage;
  final VoidCallback? onPressed;
  final double width;
  final Color? backgroundColor;
  final Color textColor;
  final bool isEnabled;
  final String text;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final height = width * (4 / 3);
    final padding = width / 12;
    final textScaleFactor = width / 75.0;

    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;
    final calculatedTextColor = isEnabled ? textColor : Colors.grey[400];

    // Determine which image to use
    final imageToDisplay = image ?? defaultImage;

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
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: EdgeInsets.all(padding),
                backgroundColor: calculatedBackgroundColor,
                fixedSize: Size(width, width),
              ),
              child: imageToDisplay != null
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Image(
                            image: imageToDisplay,
                            width: width - (2 * padding),
                            height: width - (2 * padding),
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (!isEnabled)
                          Container(
                            width: width - (2 * padding),
                            height: width - (2 * padding),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(158, 158, 158, 0.7),
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                      ],
                    )
                  : Icon(
                      Icons.image,
                      size: width - (2 * padding),
                      color: Colors.grey[600],
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
