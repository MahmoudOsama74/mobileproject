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
      /*() {
        // Validate returns true if the form is valid, or false otherwise.
        if (form.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return widget;
              },
            ),
          );
        }
      },*/
      child: Text(name.toUpperCase()),
    ),
  );
}