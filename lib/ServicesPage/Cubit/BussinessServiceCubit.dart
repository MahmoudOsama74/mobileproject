import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/ServicesPage/Cubit/BusinessServiceStates.dart';

import '../../Login/components/constants.dart';
import '../model/AddServiceToFavoritModel.dart';
import '../model/CompanyProfileForServiceModel.dart';
import '../model/CreateServiceModel.dart';
import '../model/GetAllServiceModel.dart';
import '../model/ServiceOfCompanyMpdel.dart';
import '../model/allCompanyModel.dart';

class BusinessServiceCubit extends Cubit<BusinessServiceStates> {
  BusinessServiceCubit() : super(InitialState());

  static BusinessServiceCubit get(context) => BlocProvider.of(context);

  AddServiceToFavoriteModel? addServiceToFavoriteModel;
  AllCompanyModel? allCompanyModel;
  CompanyProfileForServiceModel? companyProfileForServiceModel;
  CreateServiceModel? createServiceModel;
  GetAllServiceModel? getAllServiceModel;
  ServiceOfCompanyModel? serviceOfCompanyModel;

  void createService({
   required String name,
    required String description
  })async{
    emit(CreateServiceLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/createService');
    final data ={
      "name":name,
      "description":description
    };
    final jsonData = json.encode(data);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body:jsonData
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      createServiceModel = CreateServiceModel.fromJson(json.decode(response.body));
      emit(CreateServiceSuccessState(createServiceModel!));
    }
    else{
      emit(CreateServiceErrorState(response.body.toString()));
    }
  }
  void addServiceToFavorite({
    required int service_id,
  })async{
    emit(AddServiceToFavoriteLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/favService');
    final data ={
      "service_id":service_id
    };
    final jsonData = json.encode(data);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body:jsonData
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      addServiceToFavoriteModel = AddServiceToFavoriteModel.fromJson(json.decode(response.body));
      emit(AddServiceToFavoriteSuccessState(addServiceToFavoriteModel!));
    }
    else{
      emit(AddServiceToFavoriteErrorState(response.body.toString()));
    }
  }

  void getAllService()async{
    emit(GetAllServiceLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getServices');
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print("response");
      getAllServiceModel = GetAllServiceModel.fromJson(json.decode(response.body));
      emit(GetAllServiceSuccessState(getAllServiceModel!));
    }
    else{
      emit(GetAllServiceErrorState(response.body.toString()));
    }
  }
  void getAllCompanies()async{
    emit(AllCompanyLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getAllCompanies');
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      allCompanyModel = AllCompanyModel.fromJson(json.decode(response.body));
      emit(AllCompanySuccessState(allCompanyModel!));
    }
    else{
      emit(AllCompanyErrorState(response.body.toString()));
    }
  }
  void getAllFavorite()async{
    emit(GetAllServiceLoadingState());
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getFavoriteServices');
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    });
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      print("response");
      getAllServiceModel = GetAllServiceModel.fromJson(json.decode(response.body));
      emit(GetAllServiceSuccessState(getAllServiceModel!));
    }
    else{
      emit(GetAllServiceErrorState(response.body.toString()));
    }
  }
  void getAllServiceOfCompany({
    required int id,
  })async{
    emit((ServiceOfCompanyLoadingState()));
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getCompanyServices');
    final data ={
      "id":id
    };
    final jsonData = json.encode(data);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body:jsonData
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      serviceOfCompanyModel = ServiceOfCompanyModel.fromJson(json.decode(response.body));
      emit(ServiceOfCompanySuccessState(serviceOfCompanyModel!));
    }
    else{
      emit(ServiceOfCompanyErrorState(response.body.toString()));
    }
  }
  void getCompanyProfileForService({
    required int id,
  })async{
    emit((CompanyProfileForServiceLoadingState()));
    final uri =
    Uri.https('mobileenterpriseapplication-production.up.railway.app', '/api/Auth/getServiceCompany');
    final data ={
      "id":id
    };
    final jsonData = json.encode(data);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:token != null?'Bearer $token':'Bearer',
    },body:jsonData
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      print("response");
      companyProfileForServiceModel = CompanyProfileForServiceModel.fromJson(json.decode(response.body));
      emit(CompanyProfileForServiceSuccessState(companyProfileForServiceModel!));
    }
    else{
      emit(CompanyProfileForServiceErrorState(response.body.toString()));
    }
  }
}