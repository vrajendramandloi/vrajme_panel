import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration commonContainerBoxDecoration ({Color backColor = Colors.white, double radius  = 25 , bool shadow = true, BoxShape boxShape = BoxShape.rectangle, 
            double blurSpredRdus = 0.5, Offset offset = const Offset(0, 3)}) {
    return BoxDecoration(
      color: backColor,
      borderRadius: boxShape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
      shape: boxShape,
      boxShadow: [ 
        shadow ? BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: blurSpredRdus,
            blurRadius: blurSpredRdus,
            offset: offset, // changes position of shadow
          )
          : BoxShadow(color: Colors.black.withOpacity(0.1))
      ],
      /* border: Border.all(color: Colors.transparent, style: BorderStyle.solid, width: 0), */
      border: Border.all(style: BorderStyle.none, width: 0, color: Colors.white),
    );
  }

  static Border noBorder() {
    return const Border(left: BorderSide.none,right: BorderSide.none,top: BorderSide.none,bottom: BorderSide.none);
  }

  static const LinearGradient APP_WHITE_TRANSPARENT_GRADIENT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // Add one stop for each color. Stops should increase from 0 to 1
    stops: [0.1, 0.9],
    colors: [
      Color.fromRGBO(0, 0, 0, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ],
  );

  static BoxDecoration gradientContainerBoxDecoration ({Gradient gradient = APP_WHITE_TRANSPARENT_GRADIENT, 
        double radius  = 25, bool shadow = true,}) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius:  BorderRadius.circular(radius),
      boxShadow: shadow ? [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 3), // changes position of shadow
          )
      ] : [],
      /* border: Border.all(color: Colors.transparent, style: BorderStyle.solid, width: 0), */
      border: Border.all(style: BorderStyle.none, width: 0, color: Colors.white),
    );
  }
}