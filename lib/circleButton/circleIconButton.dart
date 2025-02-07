import 'package:flutter/material.dart';
import 'package:vrajme_panel/appDecorations.dart';

class CircleIconButton extends StatelessWidget {
  final Function() ? onPressed;
  final Icon ? icon;
  const CircleIconButton({Key ? key, @required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppDecorations.commonContainerBoxDecoration(boxShape: BoxShape.circle),
        child: icon
      )
    );
  }
}