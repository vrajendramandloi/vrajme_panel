import 'package:flutter/material.dart';

class CirclePinButton extends StatelessWidget {
  final Function()? onPressed;
  final double? iconSize;
  final Color? iconColor;
  const CirclePinButton({Key ? key, this.onPressed, this.iconSize = 20, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        /* decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle), */
        child: Icon(Icons.push_pin_sharp, color: iconColor, size: iconSize,),
      )
    );
  }
}