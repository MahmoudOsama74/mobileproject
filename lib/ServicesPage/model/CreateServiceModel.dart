class CreateServiceModel {
  String? message;
  BusinessService? businessService;

  CreateServiceModel({this.message, this.businessService});

  CreateServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    businessService = json['business Service'] != null
        ? new BusinessService.fromJson(json['business Service'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.businessService != null) {
      data['business Service'] = this.businessService!.toJson();
    }
    return data;
  }
}

class BusinessService {
  String? name;
  String? description;
  int? userId;
  int? id;

  BusinessService({this.name, this.description, this.userId, this.id});

  BusinessService.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    userId = json['user_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    return data;
  }
}