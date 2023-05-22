


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MyMap{
  late GoogleMapController mapController;
  static Future<LatLng?> getLocation() async {
    List<double>? latlang;
    late LatLng _center = const LatLng(29.8897823, 31.291431);
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    try{
      _locationData = await location.getLocation();
    }on Exception {
      _locationData = null;
    }
    if(_locationData?.latitude!=null&&_locationData?.longitude!=null ) {
      double? X=_locationData?.latitude;
      double? Y=_locationData?.longitude;
      _center = LatLng(X!,Y!);
      latlang?.add(_center.longitude);
      latlang?.add(_center.latitude);
    }
    return _center;
  }
}