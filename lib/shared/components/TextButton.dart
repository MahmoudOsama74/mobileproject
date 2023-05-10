import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



Widget dataShowInButton(String data,{Color textColor:const Color(0xFF04342A),Color backgroundColor:const Color(0xFFE7E7E7)}){
  return TextButton(
    onPressed: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color:  backgroundColor,
        borderRadius:BorderRadius.circular(7),
      ),
      child:  Text(
        data,
        style:  TextStyle(color:textColor, fontSize: 13.0),
      ),
    ),
  );
}



