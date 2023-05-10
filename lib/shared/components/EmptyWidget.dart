import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';

Widget noData(String ownTitle,String ownSubTitle){
  return EmptyWidget(
    image: null,
    packageImage: PackageImage.Image_1,
    title: ownTitle,
    subTitle:ownSubTitle,
    titleTextStyle: const TextStyle(
      fontSize: 22,
      color: Color(0xff9da9c7),
      fontWeight: FontWeight.w500,
    ),
    subtitleTextStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xffabb8d6),
    ),
  );
}