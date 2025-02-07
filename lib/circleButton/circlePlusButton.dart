import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class CirclePlusButton extends StatelessWidget {
  final Function() ? onPressed;
  final double ? iconSize;
  final Color ? iconColor;
  const CirclePlusButton({super.key, this.onPressed, this.iconSize = 20, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(Entypo.circle_with_plus, color: iconColor, size: iconSize,),
    );
  }
}