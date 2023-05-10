import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleWidget(String name){
  return Stack(
    children: <Widget>[
      // Stroked text as border.
      Text(
        name,
        style: TextStyle(
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = const Color(0xFF344E41),
        ),
      ),
      // Solid text as fill.
      Text(
        name,
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey[300],
        ),
      ),
    ],
  );
}