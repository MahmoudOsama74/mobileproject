class SignUpModel {
  String? message;
  User? user;

  SignUpModel({this.message, this.user});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? email;
  String? lang;
  String? lat;
  String? companyAddress;
  String? companySize;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
        this.contactPersonName,
        this.contactPersonPhoneNumber,
        this.email,
        this.lang,
        this.lat,
        this.companyAddress,
        this.companySize,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    contactPersonName = json['contact_person_name'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    email = json['email'];
    lang = json['lang'];
    lat = json['lat'];
    companyAddress = json['company_address'];
    companySize = json['company_size'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_phone_number'] = this.contactPersonPhoneNumber;
    data['email'] = this.email;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['company_address'] = this.companyAddress;
    data['company_size'] = this.companySize;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}