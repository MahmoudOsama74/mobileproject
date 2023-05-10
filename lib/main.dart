import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Login/components/LoginPage.dart';
import 'Login/components/constants.dart';
import 'Profile/CompanyProfile.dart';
import 'Profile/UpdateProfile.dart';

import 'ServicesPage/Business Services/bServicesList.dart';
import 'Signup/components/signup_form.dart';
import 'constants.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  token = await CacheHelper.getData(key: 'token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Project',
          theme: ThemeData(
              primaryColor: Color(0xFF7F8A88),
              scaffoldBackgroundColor: Colors.white,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color(0xFF04342A),
                  shape: const StadiumBorder(),
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Color(0xFFBECCCA),
                iconColor: Color(0xFF000000),
                prefixIconColor: Color(0xFF000000),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              )),
          home: LoginForm(),
        );
      },
    );
  }
}