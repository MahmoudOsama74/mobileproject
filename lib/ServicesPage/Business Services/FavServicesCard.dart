import 'dart:io';
import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobileproject/ServicesPage/model/bServicesModel.dart';

import '../../Profile/CompanyProfile.dart';
import 'package:provider/provider.dart';

import '../../shared/styles/colors.dart';
import '../Cubit/BusinessServiceStates.dart';
import '../Cubit/BussinessServiceCubit.dart';
import '../Cubit/FavoriteIcon.dart';




Widget favServicesCard(BuildContext context,favoriteBusinessService,GlobalKey<ScaffoldState> scaffoldKey,int index){
  var _formKey105 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  String? imagepath=favoriteBusinessService.companyPhoto;
 var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>CompanyScreen(id: favoriteBusinessService.serviceId,),
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
                      favoriteBusinessService.companyName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    ChangeNotifierProvider(
                      create: (_) => FavoriteProvider(),
                      child: Consumer<FavoriteProvider>(
                        builder: (context, favoriteProvider, _) =>
                            IconButton(
                              icon: Icon(
                                favoriteProvider.isBookmarked? Icons.favorite_outline : Icons.favorite,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                BusinessServiceCubit.get(context).addServiceToFavorite(
                                    service_id: favoriteBusinessService.serviceId
                                );
                                BusinessServiceCubit.get(context).getAllFavorite();
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
                  children:  [
                    Text(
                      favoriteBusinessService.serviceName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      favoriteBusinessService.serviceDescription,
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

