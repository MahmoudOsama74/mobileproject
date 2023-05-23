class GetAllServiceModel {
  String? message;
  List<Services>? services;

  GetAllServiceModel({this.message, this.services});

  GetAllServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? serviceId;
  String? serviceName;
  String? serviceDescription;
  String? companyName;
  String? companyPhoto;
  int? companyId;
  double? companyLat;
  double? companyLong;

  Services(
      {this.serviceId,
        this.serviceName,
        this.serviceDescription,
        this.companyName,
        this.companyPhoto,
        this.companyId,
        this.companyLat,
        this.companyLong});

  Services.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceDescription = json['service_description'];
    companyName = json['Company_name'];
    companyPhoto = json['Company_photo'];
    companyId = json['Company_id'];
    companyLat = json['Company_lat'];
    companyLong = json['Company_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_description'] = this.serviceDescription;
    data['Company_name'] = this.companyName;
    data['Company_photo'] = this.companyPhoto;
    data['Company_id'] = this.companyId;
    data['Company_lat'] = this.companyLat;
    data['Company_long'] = this.companyLong;
    return data;
  }
}