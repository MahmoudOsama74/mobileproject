import 'dart:convert';

class LoginModel {
  String? accessToken;
  String? tokenType;
  User? user;

  LoginModel({this.accessToken, this.tokenType, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? contactPersonName;
  Null? companyIndustry;
  String? contactPersonPhoneNumber;
  String? companyAddress;
  String? companySize;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.contactPersonName,
        this.companyIndustry,
        this.contactPersonPhoneNumber,
        this.companyAddress,
        this.companySize});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contactPersonName = json['contact_person_name'];
    companyIndustry = json['company_industry'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    companyAddress = json['company_address'];
    companySize = json['company_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['contact_person_name'] = this.contactPersonName;
    data['company_industry'] = this.companyIndustry;
    data['contact_person_phone_number'] = this.contactPersonPhoneNumber;
    data['company_address'] = this.companyAddress;
    data['company_size'] = this.companySize;
    return data;
  }
}