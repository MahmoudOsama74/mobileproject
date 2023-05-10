import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/Signup/cubit/states.dart';
import 'package:http/http.dart' as http;
import '../Model/MedicalInformation.dart';
import '../Model/SignUp.dart';
class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  SignUpModel? signUpModel;
  MedicalInformationModel? medicalInformationModel;

  void userSignUp({
    required String name,
    required String contact_person_name,
    required String contact_person_phone_number,
    required String email,
    required String company_address,
    required String company_size,
    required String password,
    required String password_confirmation,
  }) async {
    emit(SignUpLoadingState());
    final queryParameters = {
      "name": name,
      "contact_person_name": contact_person_name,
      "contact_person_phone_number": contact_person_phone_number,
      "email": email,
      "company_address": company_address,
      "company_size": company_size,
      "password":password,
      "password_confirmation":password_confirmation,
    };
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/register', queryParameters);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      signUpModel = SignUpModel.fromJson(json.decode(response.body));
      emit(SignUpSuccessState(signUpModel!));
    }
    else{
      emit(SignUpErrorState(response.body.toString()));
    }

  }

}
