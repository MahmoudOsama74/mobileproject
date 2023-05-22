
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




Widget CopmanyCard(BuildContext context,businessService,GlobalKey<ScaffoldState> scaffoldKey,int index){
  var _formKey105 = GlobalKey<FormState>();
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
  String?imagepath="/data/user/0/com.example.mobileproject/cache/f87346ef-4e50-4ee0-810c-e9acf8c57726/IMG-20230522-WA0120.jpg";
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
                        print("idFFFFF: ${businessService.companyId}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>CompanyScreen(id: businessService.companyId,),
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
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_right_sharp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>CompanyScreen(id: businessService.companyId,),
                          ),
                        );
                      },
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

