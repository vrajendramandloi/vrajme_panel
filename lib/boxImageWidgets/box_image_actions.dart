import 'package:flutter/material.dart';

class BoxImageActions extends StatelessWidget {
  const BoxImageActions({
    super.key,
    this.image,
    this.defaultImage,
    this.onPressed,
    required this.width,
    this.backgroundColor,
    this.isEnabled = true,
    this.onCancel,
    this.cancelButtonSize = 20.0,
    this.borderRadius = 15.0, // Add borderRadius property
  });

  final ImageProvider? image;
  final ImageProvider? defaultImage;
  final VoidCallback? onPressed;
  final double width;
  final Color? backgroundColor;
  final bool isEnabled;
  final VoidCallback? onCancel;
  final double cancelButtonSize;
  final double borderRadius; // Add borderRadius property

  @override
  Widget build(BuildContext context) {
    final height = width; // Height is same as width for a square
    final padding = width / 24;
    final calculatedCancelButtonSize = width / 4; // Adjust cancel button size relative to width

    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;

    // Determine which image to use
    final imageToDisplay = image ?? defaultImage;

    return Stack(
      children: [
        InkWell(
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
                    fixedSize: Size(width, width), // Use width for both dimensions
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
              ],
            ),
          ),
        ),
        if (onCancel != null)
          Positioned(
            top: padding / 2,
            right: padding / 2,
            child: InkWell(
              onTap: onCancel,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                width: calculatedCancelButtonSize,
                height: calculatedCancelButtonSize,
                child: Icon(Icons.cancel, size: calculatedCancelButtonSize * 0.8, color: Colors.red),
              ),
            ),
          ),
      ],
    );
  }
}
