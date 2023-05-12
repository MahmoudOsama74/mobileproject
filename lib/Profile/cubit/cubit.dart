import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/Login/cubit/states.dart';
import 'package:mobileproject/Profile/cubit/states.dart';
import '../../../network/end_points.dart';
import '../../../network/remote/dio_helper.dart';
import '../../Login/components/constants.dart';
import '../Model/ResetPassword.dart';
import '../Model/UpdateProfileModel.dart';
import 'package:http/http.dart' as http;

import '../Model/UserInformationModel.dart';
class UpdateProfileCubit extends Cubit<UpdateStates> {
  UpdateProfileCubit() : super(UpdateProfileInitialState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  UpdateProfileModel? updateProfileModel;
  UserInformationModel? userInformationModel;
  void userUpdate({
    required String name,
    required String contact_person_name,
    required String contact_person_phone_number,
    required String company_address,
    required String company_size,
  })async
  {
    emit(UpdateProfileLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/update');
    final response = await http.patch(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body: {
      "name":name,
      "contact_person_name":contact_person_name,
      "contact_person_phone_number":contact_person_phone_number,
      "company_address":company_address,
      "company_size":company_size
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      updateProfileModel = UpdateProfileModel.fromJson(json.decode(response.body));
      emit(UpdateProfileSuccessState(updateProfileModel!));
    }
    else{
      emit(UpdateProfileErrorState(response.body.toString()));
    }
  }
  void userData()async
  {
    emit(UpdateProfileLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getCompany');
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      userInformationModel = UserInformationModel.fromJson(json.decode(response.body));
      emit(UpdateProfileSuccessState(updateProfileModel!));
    }
    else{
      emit(UpdateProfileErrorState(response.body.toString()));
    }
  }
}
class UpdatePasswordCubit extends Cubit<UpdateStates> {
  UpdatePasswordCubit() : super(UpdateProfileInitialState());

  static UpdatePasswordCubit get(context) => BlocProvider.of(context);

  UpdatePasswordModel? updatePasswordModel;
  void userUpdatePassword({
    required String old_password,
    required String new_password,
    required String new_password_confirmation,
  })async
  {
    emit(UpdatePasswordLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/changePassword');
    final response = await http.patch(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body: {
      "old_password":old_password,
      "new_password":new_password,
      "new_password_confirmation":new_password_confirmation
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print("response");
      updatePasswordModel = UpdatePasswordModel.fromJson(json.decode(response.body));
      emit(UpdatePasswordSuccessState(updatePasswordModel!));
    }
    else{
      emit(UpdateProfileErrorState(response.body.toString()));
    }
  }
}