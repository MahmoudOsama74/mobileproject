import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String? message,Color backgroundColorForToast,Color textColorForToast){
  return Fluttertoast.showToast(
    msg: message??'Error',
    timeInSecForIosWeb: 3,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColorForToast,
    textColor: textColorForToast,
  );
}