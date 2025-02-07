import 'package:flutter/material.dart';
import 'package:vrajme_panel/appDecorations.dart';

class CircleCompleteButton extends StatelessWidget {
  final Function()? onPressed;
  final double? iconSize;
  final Color? iconColor;
  const CircleCompleteButton({Key? key, this.onPressed, this.iconSize = 20, this.iconColor = Colors.green}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle),
        child: Icon(Icons.check_circle, color: iconColor, size: iconSize,),
      )
    );
  }
}