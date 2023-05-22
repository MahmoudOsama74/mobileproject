import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DeleteBottomDialog(int index,GlobalKey<ScaffoldState> scaffoldKey,GlobalKey<FormState> _formKey105,String distance){
  return FloatingActionButton.small(
    heroTag: "btnDelete$index",
    backgroundColor: Colors.white,
    foregroundColor:const Color(0xFF04342A) ,
    onPressed: () {
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
                    const Text("       This is Distance between current position and this\n company position",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(
                        0xFF04342A) ),),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(children: [
                        FloatingActionButton.extended(
                            heroTag: "btnCancel$index",
                            backgroundColor: Colors.white,
                            foregroundColor:const Color(0xFF026241) ,
                            label: Row(children:  [
                              const Icon(Icons.directions_walk_outlined),
                              Text(distance)
                            ],),
                            onPressed:  (){
                              Navigator.pop(context);
                              //BloodPressureCreatedTestCubit.get(context).changeIconAdd();
                            }),
                        const Spacer(),
                        FloatingActionButton.extended(
                            heroTag: "btnCancel$index",
                            backgroundColor: Colors.white,
                            foregroundColor:const Color(0xFF026241) ,
                            label: Row(children: const [
                              Icon(Icons.offline_pin_outlined),
                              Text("Done")
                            ],),
                            onPressed:  (){
                              Navigator.pop(context);
                              //BloodPressureCreatedTestCubit.get(context).changeIconAdd();
                            }),


                      ],),
                    ),

                  ]),
            ),
          ),
      );
    },
    child: const Icon(Icons.location_on),
  );
}