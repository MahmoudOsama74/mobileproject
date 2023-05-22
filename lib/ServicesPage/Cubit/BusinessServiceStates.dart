
import 'package:mobileproject/ServicesPage/model/CreateServiceModel.dart';

import '../model/AddServiceToFavoritModel.dart';
import '../model/CompanyProfileForServiceModel.dart';
import '../model/DistanceCompanyToUser.dart';
import '../model/GetAllServiceModel.dart';
import '../model/ServiceOfCompanyMpdel.dart';
import '../model/allCompanyModel.dart';

abstract class  BusinessServiceStates{}
class InitialState extends BusinessServiceStates {}

class CreateServiceLoadingState extends BusinessServiceStates {}

class CreateServiceSuccessState extends BusinessServiceStates
{
  late CreateServiceModel createServiceModel;

  CreateServiceSuccessState(this.createServiceModel);
}

class CreateServiceErrorState extends BusinessServiceStates
{
  final String error;

  CreateServiceErrorState(this.error);
}


class GetAllServiceLoadingState extends BusinessServiceStates {}

class GetAllServiceSuccessState extends BusinessServiceStates
{
  late GetAllServiceModel getAllServiceModel;

  GetAllServiceSuccessState(this.getAllServiceModel);
}

class GetAllServiceErrorState extends BusinessServiceStates
{
  final String error;

  GetAllServiceErrorState(this.error);
}








class AllCompanyLoadingState extends BusinessServiceStates {}

class AllCompanySuccessState extends BusinessServiceStates
{
  late AllCompanyModel allCompanyModel;

  AllCompanySuccessState(this.allCompanyModel);
}

class AllCompanyErrorState extends BusinessServiceStates
{
  final String error;

  AllCompanyErrorState(this.error);
}





class CompanyProfileForServiceLoadingState extends BusinessServiceStates {}

class CompanyProfileForServiceSuccessState extends BusinessServiceStates
{
  late CompanyProfileForServiceModel companyProfileForServiceModel;

  CompanyProfileForServiceSuccessState(this.companyProfileForServiceModel);
}

class CompanyProfileForServiceErrorState extends BusinessServiceStates
{
  final String error;

  CompanyProfileForServiceErrorState(this.error);
}




class ServiceOfCompanyLoadingState extends BusinessServiceStates {}

class ServiceOfCompanySuccessState extends BusinessServiceStates
{
  late ServiceOfCompanyModel serviceOfCompanyModel;

  ServiceOfCompanySuccessState(this.serviceOfCompanyModel);
}

class ServiceOfCompanyErrorState extends BusinessServiceStates
{
  final String error;

  ServiceOfCompanyErrorState(this.error);
}


class DistanceCompanyToUserLoadingState extends BusinessServiceStates {}

class DistanceCompanyToUserSuccessState extends BusinessServiceStates
{
  late DistanceCompanyToUser distanceCompanyToUser;

  DistanceCompanyToUserSuccessState(this.distanceCompanyToUser);
}

class DistanceCompanyToUserErrorState extends BusinessServiceStates
{
  final String error;

  DistanceCompanyToUserErrorState(this.error);
}







class AddServiceToFavoriteLoadingState extends BusinessServiceStates {}

class AddServiceToFavoriteSuccessState extends BusinessServiceStates
{
  late AddServiceToFavoriteModel addServiceToFavoriteModel;

  AddServiceToFavoriteSuccessState(this.addServiceToFavoriteModel);
}

class AddServiceToFavoriteErrorState extends BusinessServiceStates
{
  final String error;

  AddServiceToFavoriteErrorState(this.error);
}




