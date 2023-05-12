import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../Login/components/LoginPage.dart';
import '../../Profile/UpdateProfile.dart';
import '../../shared/components/toast.dart';
import '../Model/UserRegister.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LocationForUser extends StatefulWidget {

  const LocationForUser({required this.userRegister,Key? key }) : super(key: key);
  final UserRegister userRegister;
  @override
  State<LocationForUser> createState() => _LocationForUser();
}

class _LocationForUser extends State<LocationForUser> {
  //get map controller to access map
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  String _draggedAddress = "";
  @override
  void initState() {
    _init();
    super.initState();
  }
  _init() {
    //set default latlng for camera position
    _defaultLatLng = LatLng(11, 104);
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(
        target: _defaultLatLng,
        zoom: 17.5 // number of map view
    );

    //map will redirect to my current location when loaded
    _gotoUserCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SignUpCubit()
        ),
      ],
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginForm()),
            );
            showToast(state.signUpModel.message,Colors.green,Colors.white);
          }
          if (state is SignUpErrorState){
            showToast(state.error,Colors.red,Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(context),
            //get a float button to click and go to current location
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xFF04342A),
              onPressed: () {
                _gotoUserCurrentPosition();
              },
              child: const Icon(Icons.location_on),
            ),
            floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterFloat ,
          );
        },
      ),
    );
  }
  Widget _buildBody(BuildContext context) {
    return Stack(
        children : [
          _getMap(context),
          _getCustomPin(context),
          _showDraggedAddress(context)
        ]
    );
  }
  Widget _showDraggedAddress(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
            child: Column(
              children: [
                Text(_draggedAddress, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                Row(
                  children: [
                    Text("${_draggedLatlng.longitude},   ${_draggedLatlng.latitude}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    const Spacer(),
                    FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF041454),
                      onPressed: () {
                        _gotoUserCurrentPosition();
                        print(widget.userRegister.name);
                        print(widget.userRegister.email);
                        print(widget.userRegister.contact_person_name);
                        print(widget.userRegister.contact_person_phone_number);
                        print(widget.userRegister.company_address);
                        print(widget.userRegister.company_size);
                        print(widget.userRegister.password);
                        print(widget.userRegister.password_confirmation);
                        double latt=_draggedLatlng.latitude;
                        double langg=_draggedLatlng.longitude;
                        print(_draggedLatlng.longitude);
                        print(widget.userRegister.company_industry);
                        SignUpCubit.get(context).userSignUp(
                            name: widget.userRegister.name,
                            contact_person_name: widget.userRegister.contact_person_name,
                            contact_person_phone_number: widget.userRegister.contact_person_phone_number,
                            email: widget.userRegister.email,
                            company_address: widget.userRegister.company_address,
                            company_size: widget.userRegister.company_size==""?"Micro":widget.userRegister.company_size,
                            password: widget.userRegister.password,
                            password_confirmation: widget.userRegister.password_confirmation,
                            lat: latt,
                            langg: langg,
                            company_industry:widget.userRegister.company_industry

                        );
                        if(SignUpCubit.get(context).state is SignUpSuccessState){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginForm()),
                          );
                        }

                      },
                      child: const Icon(Icons.task_alt_rounded),
                    ),
                  ],
                ),
              ],
            )
          //Text(_draggedAddress, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
        ),
      ),
    );
  }
  Widget _getMap(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _cameraPosition!, //initialize camera position for map
      mapType: MapType.normal,
      onCameraIdle: () {
        //this function will trigger when user stop dragging on map
        //every time user drag and stop it will display address
        _getAddress(_draggedLatlng);
      },
      onCameraMove: (cameraPosition) {
        //this function will trigger when user keep dragging on map
        //every time user drag this will get value of latlng
        _draggedLatlng = cameraPosition.target;
      },
      onMapCreated: (GoogleMapController controller) {
        //this function will trigger when map is fully loaded
        if (!_googleMapController.isCompleted) {
          //set controller to google map when it is fully loaded
          _googleMapController.complete(controller);
        }
      },
    );
  }
  Widget _getCustomPin(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        child: Lottie.asset("assets/pin.json"),
      ),
    );
  }
  //get address from dragged pin
  Future _getAddress(LatLng position) async {
    //this will list down all address around the position
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      _draggedAddress = addresStr;
    });
  }
  //get user's current location and set the map's camera to that location
  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(LatLng(currentPosition.latitude, currentPosition.longitude));
  }
  //go to specific position by latlng
  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: position,
            zoom: 17.5
        )
    ));
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }
  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if(!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if(locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
}