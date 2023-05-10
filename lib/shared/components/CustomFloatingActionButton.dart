import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customFloatingActionButton(Color backgroundColor,VoidCallback? onPressedButton,Icon icon){
  return FloatingActionButton.small(
    backgroundColor: backgroundColor,
    foregroundColor: Colors.white,
    onPressed:onPressedButton,
    child:icon,
  );
}


Widget deletedFloatingActionButton(VoidCallback onPressedButton){
  return customFloatingActionButton(
      Colors.white,
      onPressedButton,
      const Icon(
          Icons.dangerous_outlined,
          color: Color(0xFF6C1108),
          size: 29.0,
          semanticLabel:
          'Text to announce in accessibility modes',
      ),
  );
}
Widget informationFloatingActionButton(VoidCallback onPressedButton){
  return customFloatingActionButton(
    Colors.white,
    onPressedButton,
    const Icon(
      Icons.info_outline,
      color: Color(0xFF06228D),
      size: 29.0,
      semanticLabel:
      'Text to announce in accessibility modes',
    ),
  );
}
Widget plusFloatingActionButton(VoidCallback onPressedButton){
  return customFloatingActionButton(
     Colors.white,
    onPressedButton,
    const Icon(
        Icons.add_circle,
        color: Color(0xFF034135),
        size: 35.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
  );
}