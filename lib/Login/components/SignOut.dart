
import 'package:flutter/material.dart';

import '../../../network/local/cache_helper.dart';
import 'LoginPage.dart';


void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return  LoginForm();
          },
        ),
      );
    }
  });
}