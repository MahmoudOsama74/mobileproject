import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobileproject/Signup/cubit/states.dart';
import 'package:http/http.dart' as http;
import '../Model/MedicalInformation.dart';
import '../Model/SignUp.dart';
class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  SignUpModel? signUpModel;
  /*String draggedAddress = "";
  late LatLng defaultLatLng = LatLng(11, 104);
  late LatLng draggedLatlng = defaultLatLng;
  late CameraPosition? cameraPosition = CameraPosition(
      target: defaultLatLng,
      zoom: 17.5 // number of map view
      );*/
  late String name;
  late String contact_person_name;
  late String contact_person_phone_number;
  late String email;
  late String company_address;
  late String company_size;
  late String password;
  late String password_confirmation;
  late Completer<GoogleMapController> googleMapController = Completer();
  void CopyPlease({
  required String name,
  required String contact_person_name,
  required String contact_person_phone_number,
  required String email,
  required String company_address,
  required String company_size,
  required String password,
  required String password_confirmation,
  }){
    this.name=name;
    this.contact_person_name=contact_person_name;
    this.contact_person_phone_number=contact_person_phone_number;
    this.email=email;
    this.company_address=company_address;
    this.company_size=company_size;
    this.company_address=password;
    this.company_size=password;
  }
  void userSignUp({
    required String name,
    required String contact_person_name,
    required String contact_person_phone_number,
    required String email,
    required String company_address,
    required String company_size,
    required String password,
    required String password_confirmation,
    required double lat,
    required double lang,
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
      "lat":lat,
      "lang":lang
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
    else if(response.statusCode==400){
      emit(SignUpErrorState("The email has already been taken."));
    }

  }

}
