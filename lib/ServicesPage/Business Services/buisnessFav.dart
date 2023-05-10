
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/bServicesModel.dart';
import 'bServicesCard.dart';


class BusinessServicesFav extends StatelessWidget {
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var _formKey101 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  IconData fabIcon2=Icons.add;
  var rng = Random();

  BusinessServicesFav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton.small(
        heroTag: "baseXBtn1",
        elevation: 20,
        backgroundColor:Colors.white ,
        foregroundColor: Colors.white,
        onPressed: () {
          scaffoldKey.currentState?.showBottomSheet((context) =>
          const SizedBox(
            height: 400,
            child: SingleChildScrollView(
            ),
          ),
          );
        },

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  bloodPressureCard(context,BusinessServicesData(),scaffoldKey,index),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}