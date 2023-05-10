import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showDateInButton(String date){
  return TextButton(
    onPressed: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(
          vertical: 9, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        date,
        style: const TextStyle(
            color: Color(0xFF04342A), fontSize: 13.0),
      ),
    ),
  );
}