import 'dart:convert';

class SignUpModel
{
  late String message;
  late SignUpData? user;

  SignUpModel({required this.message,required this.user});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonn)
  {
    print("fffff");
    SignUpModel L= SignUpModel(
        message: jsonn['message'] as String,
        user:jsonn['user'] != null ? SignUpData.fromJson(jsonn['user']) : null
    );

    return L;
  }
}

class SignUpData
{
  late int id;
  late String name;
  late String contact_person_name;
  late String contact_person_phone_number;
  late String email;
  late String company_address;
  late String company_size;
  SignUpData({required this.id,required this.name,required this.contact_person_name,required this.contact_person_phone_number,
    required this.email,required this.company_address,required this.company_size,});
  // named constructor
  factory SignUpData.fromJson(Map<String, dynamic> jsonn)
  {
    return SignUpData(
      name : jsonn['name'] as String,
      contact_person_name :jsonn['contact_person_name'] as String,
      contact_person_phone_number :jsonn['contact_person_phone_number']as String,
      email : jsonn['email'] as String,
      company_address : jsonn['company_address'] as String,
      company_size : jsonn['company_size'] as String,
      id:jsonn['id'] as int
    );
  }
}