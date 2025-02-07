import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class CircleAlarmButton extends StatelessWidget {
  final Function()? onPressed;
  final double iconSize;
  final Color iconColor;
  const CircleAlarmButton({Key? key, this.onPressed, this.iconSize = 20, this.iconColor = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Icon(Entypo.bell,  color: iconColor, size: iconSize,),
      )
    );
  }
}