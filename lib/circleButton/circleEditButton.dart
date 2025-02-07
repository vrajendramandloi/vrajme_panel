import 'package:flutter/material.dart';
import 'package:vrajme_panel/appDecorations.dart';

class CircleEditButton extends StatelessWidget {
  final Function() ? onPressed;
  final double iconSize;
  final Color iconColor;
  const CircleEditButton({Key? key, @required this.onPressed, this.iconSize = 20, this.iconColor = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle),
        child: Icon(Icons.edit, color: iconColor, size: iconSize,),
      )
    );
  }
}