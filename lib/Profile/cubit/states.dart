

import '../Model/ResetPassword.dart';
import '../Model/UpdateProfileModel.dart';
import '../Model/UserInformationModel.dart';

abstract class UpdateStates {}

class UpdateProfileInitialState extends UpdateStates {}

class UpdateProfileLoadingState extends UpdateStates {}

class UpdateProfileSuccessState extends UpdateStates
{
  late UpdateProfileModel updateProfileModel;

  UpdateProfileSuccessState(this.updateProfileModel);
}
class UserInformationSuccessState extends UpdateStates
{
  late UserInformationModel userInformationModel;

  UserInformationSuccessState(this.userInformationModel);
}

class UpdateProfileErrorState extends UpdateStates
{
  final String error;

  UpdateProfileErrorState(this.error);
}
class UserInformationLoadingState extends UpdateStates {}
class UserInformationErrorState extends UpdateStates
{
  final String error;

  UserInformationErrorState(this.error);
}
class UpdatePasswordInitialState extends UpdateStates {}

class UpdatePasswordLoadingState extends UpdateStates {}

class UpdatePasswordSuccessState extends UpdateStates
{
  late UpdatePasswordModel updatePasswordModel;

  UpdatePasswordSuccessState(this.updatePasswordModel);
}

class UpdatePasswordErrorState extends UpdateStates
{
  late UpdatePasswordModel updatePasswordModel;

  UpdatePasswordErrorState(this.updatePasswordModel);
}

class ShopChangePasswordVisibilityState extends UpdateStates {}
