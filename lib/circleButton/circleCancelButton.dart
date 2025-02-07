import 'package:flutter/material.dart';
import 'package:vrajme_panel/appDecorations.dart';

class CircleCancelButton extends StatelessWidget {
  final Function()? onPressed;
  final double? iconSize;
  final Color? iconColor;
  const CircleCancelButton({Key? key, @required this.onPressed, this.iconSize = 20, this.iconColor = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle),
        child: Icon(Icons.cancel, color: iconColor, size: iconSize,),
      )
    );
  }
}