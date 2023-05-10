import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget safeBox(){
  return const SizedBox(height: 40);
}

Widget buttonBack(BuildContext context){
  return IconButton(
    icon:const Icon(
      Icons.arrow_back,
      color: Color(0xFF04342A),
      size: 29.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
Widget title(String txt){
  return Padding(
    padding:const EdgeInsets.symmetric(vertical: 10,horizontal:2),
    child: Text(
      txt,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:27,
        fontStyle: FontStyle.italic,
        color: Color(0xFF3E6864),
      ),
      textAlign: TextAlign.left,
    ),
  );
}