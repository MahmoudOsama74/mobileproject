import 'package:flutter/material.dart';
import '../styles/IconBroken.dart';
import '../styles/colors.dart';

Widget defaultTextField({
  String? labelText,
  String? hintText,
  Color? fillColor,
  Color? textStyleColor,
  bool? filled,
  bool suffix = false,
  bool obscure = false,
  IconData? prefixIcon = null,
  IconData? suffixIcon,
  double? radius,
  TextInputType? type,
  TextEditingController? controller,
  Function? suffixPress,
  Function? validate,
  Function? onSubmit,
}) =>
    TextFormField(
      style: TextStyle(
        color: textStyleColor,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffix != false
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () => suffixIcon != null ? suffixPress!() : null,
              )
            : Icon(suffixIcon),
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: radius != null
              ? BorderRadius.circular(radius)
              : BorderRadius.circular(0),
        ),
      ),
      obscureText: obscure,
      keyboardType: type,
      controller: controller,
      validator: (value) => validate!(value),
      // onFieldSubmitted: (value) => onSubmit!()  ,
    );

Widget underLineTextField({
  String? labelText,
  String? hintText,
  Color textStyleColor = Colors.black,
  Color hintTextColor = Colors.black,
  Color suffixColor = Colors.black87,
  Color prefixColor = Colors.black87,
  bool suffix = false,
  bool obscure = false,
  IconData? prefixIcon = null,
  IconData? suffixIcon,
  double? radius,
  TextInputType? type,
  TextEditingController? controller,
  Function? suffixPress,
  Function? validate,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  int? maxLength,
  Color focusedColor = defaultTealAccent,
  Color cursorColor = defaultTealAccent,
  Color labelColor = defaultColor,
  Color fillColor = defaultWhite,
  bool filled = true,
  // bool  autoValidate = false ,
  double textSize = 18,
  double hintSize = 16,
  double prefixSize = 28,
  double suffixSize = 24,
  bool autoValidate = false,
}) =>
    TextFormField(
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      style: TextStyle(
        color: textStyleColor,
        fontSize: textSize,
        letterSpacing: 0.5,
        height: 1.3,
      ),
      cursorColor: cursorColor,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        fillColor: fillColor.withOpacity(0.65),
        filled: filled,
        suffixIcon: suffix != false
            ? IconButton(
                highlightColor: Colors.transparent,
                icon: Padding(
                  padding: labelText != null
                      ? const EdgeInsetsDirectional.only(top: 15.0)
                      : const EdgeInsetsDirectional.only(
                          top: 3.0,
                        ),
                  child: Icon(
                    suffixIcon,
                    color: suffixColor,
                    size: suffixSize,
                  ),
                ),
                onPressed: () => suffixIcon != null ? suffixPress!() : null,
              )
            : Icon(suffixIcon),
        hintText: '   $hintText',
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(0.6),
          height: 1.8,
          fontSize: hintSize,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 1,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            // color: Colors.black.withOpacity(0.8),
            color: defaultGrey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
          ),
        ),
      ),
      obscureText: obscure,
      keyboardType: type,
      controller: controller,
      validator: (value) => validate!(value),
      onFieldSubmitted: (value) => onSubmit!(value) ?? () {},
      // onEditingComplete: (){
      //   print('Completed');
      //   autoValidate = false;
      // },
      onChanged: (value) => onChange!(value),
      onTap: () => onTap!(),
    );

Widget backArrow(context,
        {Color iconColor = Colors.white,
        double iconSize = 30,
        bool isLastMessage = false}) =>
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        IconBroken.Arrow___Left_2,
        color: iconColor,
        size: iconSize,
      ),
    );
