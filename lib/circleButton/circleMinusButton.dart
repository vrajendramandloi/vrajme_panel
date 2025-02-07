import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class CircleMinusButton extends StatelessWidget {
  final Function()? onPressed;
  final double? iconSize;
  final Color? iconColor;
  const CircleMinusButton({Key? key, this.onPressed, this.iconSize = 20, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(Entypo.circle_with_minus, color: iconColor, size: iconSize,),
    );
  }
}