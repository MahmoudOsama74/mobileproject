import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/Login/cubit/states.dart';
import '../../../network/end_points.dart';
import '../../../network/remote/dio_helper.dart';
import '../Model/login_model.dart';
import 'package:http/http.dart' as http;
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'username': email,
        'password': password,
      },
    ).then((value)
    {

      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error);
      emit(LoginErrorState(error.toString()));
    });
  }
  Future<void> Temp()
  async {
    emit(LoginLoadingState());
    await DioHelper.getData(
      url: TEMP,
    ).then((value)
    {
      print(value.data);
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }












  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopChangePasswordVisibilityState());
  }
}
