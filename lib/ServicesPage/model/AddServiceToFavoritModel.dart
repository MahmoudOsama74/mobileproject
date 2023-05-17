class AddServiceToFavoriteModel {
  String? message;
  BusinessService? businessService;

  AddServiceToFavoriteModel({this.message, this.businessService});

  AddServiceToFavoriteModel.fromJson(Map<String, dynamic> json) {
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
  int? serviceId;
  int? userId;
  String? updatedAt;
  String? createdAt;

  BusinessService(
      {this.serviceId, this.userId, this.updatedAt, this.createdAt});

  BusinessService.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}