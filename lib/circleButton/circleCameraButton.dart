import 'package:flutter/material.dart';
import 'package:vrajme_panel/appDecorations.dart';

class CircleCameraButton extends StatelessWidget {
  final Function()? onPressed;
  final double iconSize;
  final Color iconColor;
  const CircleCameraButton({Key? key, @required this.onPressed, this.iconSize = 20, this.iconColor = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle),
          child: Icon(Icons.camera_alt, color: iconColor, size: iconSize,),
        )
      )
    );
  }
}