import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? basicAppBar(String text){
  return AppBar(
    backgroundColor: const Color(0xFF344E41),
    title:  Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}
PreferredSizeWidget? appBarWithWidget(String text,Widget widget){
  return AppBar(
    backgroundColor: const Color(0xFF344E41),
    title: Column(
      children:[
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        const Spacer(),
        widget,
      ]
    ),
  );
}
/*List.unmodifiable(() sync* {
yield
yield const Spacer();
yield* widgets;
}())*/