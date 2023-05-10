import 'dart:convert';

class LoginModel
{
  late bool status;
  late String message;
  late UserData? data;

  LoginModel({required this.status,required this.message,required this.data});
  factory LoginModel.fromJson(Map<String, dynamic> jsonn)
  {

    LoginModel L= LoginModel(
        status: jsonn['status'] as bool,
        message: jsonn['message'] as String,
        data:jsonn['data'] != null ? UserData.fromJson(jsonn['data']) : null
    );

    return L;
  }
}

class UserData
{
  late String userId;
  late String token;
  late String role;
  UserData({required this.userId,required this.token,required this.role});
  // named constructor
  factory UserData.fromJson(Map<String, dynamic> jsonn)
  {
    return UserData(
      userId : jsonn['userId'] as String,
      token :jsonn['token'] as String,
      role :jsonn['role']as String,
    );
  }
}