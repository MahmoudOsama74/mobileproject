
import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobileproject/ServicesPage/Cubit/BusinessServiceStates.dart';
import 'package:mobileproject/ServicesPage/Cubit/BussinessServiceCubit.dart';
import 'package:mobileproject/shared/components/toast.dart';
import 'package:mobileproject/sharedFile/shared/Presentations/MainPage.dart';
import '../../Profile/CompanyProfile.dart';
import 'package:provider/provider.dart';

import '../../shared/styles/colors.dart';
import '../Cubit/FavoriteIcon.dart';
import 'DeleteBottomDialog.dart';
import 'Map.dart';




Widget bServicesCard(BuildContext context,businessService,GlobalKey<ScaffoldState> scaffoldKey,int index){
  var _formKey105 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  String? imagepath=businessService.companyPhoto;

  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
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
  return BlocConsumer<BusinessServiceCubit, BusinessServiceStates>(
    listener: (context, state) {
    },
    builder: (context, state) {
      var rng = Random();
      return Card(
        elevation: 17,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        print("iddddddddd:${businessService.companyId}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>CompanyScreen(id: businessService.companyId),
                        ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: defaultTealAccent.withOpacity(0.6),
                        radius: screenHeight * 0.0388,
                        child: ClipOval(
                          child: (imagepath != null)
                              ? Image.file(
                            File(imagepath!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                              : Container(
                            color: defaultWhite,
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      businessService.companyName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton.small(
                      heroTag: "btnDelete$index",
                      backgroundColor: Colors.white,
                      foregroundColor:const Color(0xFF04342A) ,
                      onPressed: ()async{
                        Position currentPosition = await _determineUserCurrentPosition();
                        BusinessServiceCubit.get(context).getDistanceCompanyToUser(
                            lat: currentPosition.latitude??0.0,
                            lon: currentPosition.longitude??0.0,
                            service_id: businessService.serviceId
                        );
                        /*BusinessServiceCubit.get(context).getDistanceCompanyToUser(
                            lat: 20.2658954,
                            lon: 21.4654864,
                            service_id: businessService.serviceId
                        );*/
                        if(BusinessServiceCubit.get(context).distanceCompanyToUser?.distance.toString()!=null) {
                          scaffoldKey.currentState?.showBottomSheet((context) =>
                              SizedBox(
                                height: 170,
                                child: Form(
                                  key: _formKey105,
                                  child:
                                  Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "       This is Distance between current position and this\n company position",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(
                                                  0xFF04342A)),),
                                        Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Row(children: [
                                            FloatingActionButton.extended(
                                                heroTag: "btnCancel$index",
                                                backgroundColor: Colors.white,
                                                foregroundColor: const Color(
                                                    0xFF026241),
                                                label: Row(children: [
                                                  const Icon(Icons
                                                      .directions_walk_outlined),
                                                  Text("${BusinessServiceCubit
                                                      .get(context)
                                                      .distanceCompanyToUser
                                                      ?.distance}  Km")
                                                ],),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  //BloodPressureCreatedTestCubit.get(context).changeIconAdd();
                                                }),


                                          ],),
                                        ),

                                      ]),
                                ),
                              ),
                          );
                        }

                      },
                      child: const Icon(Icons.location_on),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => FavoriteProvider(),
                      child: Consumer<FavoriteProvider>(
                        builder: (context, favoriteProvider, _) =>
                            IconButton(
                              icon: Icon(
                                favoriteProvider.isBookmarked? Icons.favorite : Icons.favorite_outline,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                BusinessServiceCubit.get(context).addServiceToFavorite(
                                    service_id: businessService.serviceId
                                );
                                BusinessServiceCubit.get(context).getAllService();
                                favoriteProvider.isBookmarked =!favoriteProvider.isBookmarked;
                                },
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessService.serviceName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      businessService.serviceDescription,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

}

