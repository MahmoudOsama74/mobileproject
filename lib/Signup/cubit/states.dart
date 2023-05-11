import '../Model/MedicalInformation.dart';
import '../Model/SignUp.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates
{
  late SignUpModel signUpModel;

  SignUpSuccessState(this.signUpModel);
}

class SignUpErrorState extends SignUpStates
{
  final String error;

  SignUpErrorState(this.error);
}







