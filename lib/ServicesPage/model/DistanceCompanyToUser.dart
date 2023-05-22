class DistanceCompanyToUser {
  double? distance;

  DistanceCompanyToUser({this.distance});

  DistanceCompanyToUser.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
    return data;
  }
}