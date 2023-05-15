import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget onPressedButton(String name,VoidCallback onPressedCallFunction){
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(150, 50),
        minimumSize: const Size(150, 50),
      ),
      onPressed:onPressedCallFunction,

      child: Text(name.toUpperCase()),
    ),
  );
}