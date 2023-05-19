
import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/ServicesPage/Cubit/BusinessServiceStates.dart';
import 'package:mobileproject/ServicesPage/Cubit/BussinessServiceCubit.dart';
import 'package:mobileproject/sharedFile/shared/Presentations/MainPage.dart';
import '../../Profile/CompanyProfile.dart';
import 'package:provider/provider.dart';

import '../../shared/styles/colors.dart';
import '../Cubit/FavoriteIcon.dart';




Widget bServicesCard(BuildContext context,businessService,GlobalKey<ScaffoldState> scaffoldKey,int index){
  var _formKey105 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  String? imagepath="/data/user/0/com.example.mobileproject/cache/0876f8e6-4a4e-495b-b698-f4abb0abb8eb/IMG-20230125-WA0077.jpg";

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
                          MaterialPageRoute(builder: (context) =>CompanyScreen(id: businessService.serviceId,),
                        ),
                        );
                      },
                      child:  (imagepath != null)
                          ? Image.file(
                        File(imagepath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                          : Container(
                        color: defaultWhite,
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

