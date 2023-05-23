class CompanyProfileForServiceModel {
  String? message;
  List<CompanyProfile>? companyProfile;

  CompanyProfileForServiceModel({this.message, this.companyProfile});

  CompanyProfileForServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Company Profile'] != null) {
      companyProfile = <CompanyProfile>[];
      json['Company Profile'].forEach((v) {
        companyProfile!.add(new CompanyProfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.companyProfile != null) {
      data['Company Profile'] =
          this.companyProfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyProfile {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? companyAddress;
  String? companySize;
  String? companyIndustry;
  double? lang;
  double? lat;
  String? createdAt;
  String? updatedAt;
  String? photo;

  CompanyProfile(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.contactPersonName,
        this.contactPersonPhoneNumber,
        this.companyAddress,
        this.companySize,
        this.companyIndustry,
        this.lang,
        this.lat,
        this.createdAt,
        this.updatedAt,
        this.photo});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    contactPersonName = json['contact_person_name'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    companyAddress = json['company_address'];
    companySize = json['company_size'];
    companyIndustry = json['company_industry'];
    lang = json['lang'];
    lat = json['lat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_phone_number'] = this.contactPersonPhoneNumber;
    data['company_address'] = this.companyAddress;
    data['company_size'] = this.companySize;
    data['company_industry'] = this.companyIndustry;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photo'] = this.photo;
    return data;
  }
}