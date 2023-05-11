

import '../Model/ResetPassword.dart';
import '../Model/UpdateProfileModel.dart';

abstract class UpdateStates {}

class UpdateProfileInitialState extends UpdateStates {}

class UpdateProfileLoadingState extends UpdateStates {}

class UpdateProfileSuccessState extends UpdateStates
{
  late UpdateProfileModel updateProfileModel;

  UpdateProfileSuccessState(this.updateProfileModel);
}

class UpdateProfileErrorState extends UpdateStates
{
  final String error;

  UpdateProfileErrorState(this.error);
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
  final String error;

  UpdatePasswordErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends UpdateStates {}
