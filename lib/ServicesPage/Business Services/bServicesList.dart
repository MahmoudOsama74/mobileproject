
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/bServicesModel.dart';
import 'AddService.dart';
import 'bServicesCard.dart';


class BusinessServicesList extends StatelessWidget {
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var _formKey101 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  IconData fabIcon2=Icons.add;
  var rng = Random();

  BusinessServicesList({Key? key}) : super(key: key);
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddService();
              },
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
                  bServicesCard(context,BusinessServicesData(),scaffoldKey,index),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}