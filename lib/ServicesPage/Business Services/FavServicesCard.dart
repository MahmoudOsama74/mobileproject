import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobileproject/ServicesPage/model/bServicesModel.dart';

import '../../Profile/CompanyProfile.dart';
import 'package:provider/provider.dart';

import '../Cubit/FavoriteIcon.dart';




Widget favServicesCard(BuildContext context,favoriteBusinessService,GlobalKey<ScaffoldState> scaffoldKey,int index){
  var _formKey105 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
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
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/watchclock.png"),
                    radius: 20,
                  ),
                ),
                SizedBox(width: 8),
                const Text(
                  'Elgammal Tech',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 140),
                ChangeNotifierProvider(
                  create: (_) => FavoriteProvider(),
                  child: Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, _) =>
                        IconButton(
                          icon: Icon(
                            favoriteProvider.isBookmarked? Icons.favorite_outline : Icons.favorite,
                            color: Colors.blue,
                          ),
                          onPressed: () {favoriteProvider.isBookmarked =!favoriteProvider.isBookmarked;},
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
              children: const [
                Text(
                  "Business Service",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );


}

