class GetAllServiceModel{
  String? message;
  List<Service>? services;

  GetAllServiceModel({this.message, this.services});

  GetAllServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Services'] != null) {
      services = <Service>[];
      json['Services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.services != null) {
      data['Companies'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Service {
  int? id;
  String? name;
  String? description;
  int? userId;
  Null? createdAt;
  Null? updatedAt;

  Service(
      {this.id,
        this.name,
        this.description,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}