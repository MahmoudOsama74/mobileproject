import 'dart:convert';

class SignUpModel
{
  late bool status;
  late String message;
  late SignUpData? data;

  SignUpModel({required this.status,required this.message,required this.data});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonn)
  {
    print("fffff");
    SignUpModel L= SignUpModel(
        status: jsonn['status'] as bool,
        message: jsonn['message'] as String,
        data:jsonn['data'] != null ? SignUpData.fromJson(jsonn['data']) : null
    );

    return L;
  }
}

class SignUpData
{
  late String userId;
  late String token;
  late String role;
  SignUpData({required this.userId,required this.token,required this.role});
  // named constructor
  factory SignUpData.fromJson(Map<String, dynamic> jsonn)
  {
    return SignUpData(
      userId : jsonn['userId'] as String,
      token :jsonn['token'] as String,
      role :jsonn['role']as String,
    );
  }
}