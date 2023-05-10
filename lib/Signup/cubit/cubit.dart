import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/Signup/cubit/states.dart';
import '../../../network/end_points.dart';
import '../../../network/remote/ParseJwtToken.dart';
import '../../../network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../../Login/components/constants.dart';
import '../Model/MedicalInformation.dart';
import '../Model/SignUp.dart';
class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  SignUpModel? signUpModel;
  MedicalInformationModel? medicalInformationModel;

  void userSignUp({
    required String username,
    required String phoneNumber,
    required String name,
    required int age,
    required String CIndustry,
    required String role,
    required String email,
    required String password,
  })
  {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: SIGNUP,
      data:
      {
        'username':username,
        'password':password,
        'email':email,
        'phoneNumber':phoneNumber,
        'name':name,
        'age':age,
        'gender':CIndustry,
        'role':role
      },
      token: token,
    ).then((value)
    {
      print(value.statusCode);
      signUpModel = SignUpModel.fromJson(value.data);
      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error)
    {
      print("SSSSS");
      print(error);
      emit(SignUpErrorState(error.toString()));
    });
  }




  void userCreateMedicalInformation({
    required String userId,
    required String bloodType,
    required int currentWeight,
    required int currentHeight,
  })
  {
    emit(MedicalInformationInitialState());
    DioHelper.postData(
      url: MedicalInformation,
      data:
      {
        'userId':userId,
        'bloodType':bloodType,
        'CurrentWeight':currentWeight,
        'CurrentHeight':currentHeight,
      },
      token: token,
    ).then((value)
    {
      print(value.statusCode);
      medicalInformationModel = MedicalInformationModel.fromJson(value.data);
      emit(MedicalInformationSuccessState(medicalInformationModel!));
    }).catchError((error)
    {
      print("SSSSS");
      print(error);
      emit(MedicalInformationErrorState(error.toString()));
    });
  }



}
