import 'dart:convert';
import 'dart:io';


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
  })async
  {
    emit(LoginLoadingState());
    final queryParameters ={
      'email': email,
      'password': password,
    };
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/login', queryParameters);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print("response");
      loginModel = LoginModel.fromJson(json.decode(response.body));
      emit(LoginSuccessState(loginModel!));
    }
    else if(response.statusCode==401){
      emit(LoginErrorState("email or Password is wrong"));
    }
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
