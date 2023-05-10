
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/sharedFile/shared/cubit/states.dart';

import '../../../Profile/UpdateProfile.dart';
import '../../../ServicesPage/Business Services/bServicesList.dart';
import '../../../ServicesPage/Business Services/buisnessFav.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    UpdateScreen(),
    BusinessServicesList(),
    BusinessServicesFav(),


  ];

  List<String> titles = [
    'UpdateScreen',
    'BusinessServicesList',
    'BusinessServicesFav',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
