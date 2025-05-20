import 'package:flutter/material.dart';

class CircleImageActions extends StatelessWidget {
  const CircleImageActions({
    super.key,
    this.image,
    this.defaultImage,
    this.onPressed,
    required this.width,
    this.backgroundColor,
    this.isEnabled = true,
    this.onCancel,  // Callback for the cancel button
    this.cancelButtonSize = 20.0, // Size of the cancel button
  });

  final ImageProvider? image;       // Now accepts an ImageProvider (or null)
  final ImageProvider? defaultImage; //  For default image. Make this nullable.
  final VoidCallback? onPressed;
  final double width;
  final Color? backgroundColor;
  final bool isEnabled;
  final VoidCallback? onCancel;       // Callback for cancel button
  final double cancelButtonSize;


  @override
  Widget build(BuildContext context) {
    final radius = width / 2;
    final padding = width / 24;
    final cancelButtonSize = radius / 2;
    
    // Calculate colors based on isEnabled
    final calculatedBackgroundColor = isEnabled ? backgroundColor : Colors.grey;
    
    // Determine which image to use
    final imageToDisplay = image ?? defaultImage; // Use default if image is null

    return Stack( // Use a Stack to position the cancel button
      children: [
        InkWell(
          onTap: isEnabled ? onPressed : null,
          child: SizedBox(
            width: width,
            height: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Use CircleAvatar to display the image
                ElevatedButton(
                  onPressed: isEnabled ? onPressed : null,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(padding),
                    backgroundColor: calculatedBackgroundColor,
                    fixedSize: Size(2 * radius, 2 * radius),
                  ),
                  // Display image or placeholder
                  child: imageToDisplay != null
                      ? Stack(  // Use a Stack to overlay the gray avatar
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar( // The original image avatar
                            radius: radius - padding,
                            backgroundImage: imageToDisplay,
                          ),
                          if (!isEnabled) // Only show gray overlay if disabled
                            CircleAvatar(  // Gray overlay avatar
                              radius: radius - padding,
                              backgroundColor: const Color.fromRGBO(158, 158, 158, 0.7), 
                            ),
                        ],
                      )
                      : Icon(  // Default Icon if no image is provided
                          Icons.image,
                          size: radius - padding,
                          color: Colors.grey[600], // Slightly darker grey for placeholder
                        ),
                ),
              ],
            ),
          ),
        ),
        if (onCancel != null) // Only show cancel button if onCancel is provided
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
                width: cancelButtonSize,
                height: cancelButtonSize,
                child: Icon(Icons.cancel, size: cancelButtonSize * 0.8, color: Colors.red),
              ),
            ),
          ),
      ],
    );
  }
}
