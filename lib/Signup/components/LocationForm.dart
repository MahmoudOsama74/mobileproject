
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Login/components/LoginPage.dart';
import '../../shared/components/toast.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'Map.dart';
import 'Title.dart';
class LocationForm extends StatelessWidget {
  final GlobalKey<FormState> _form534 = GlobalKey<FormState>();
  LocationForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              floatingActionButton:FloatingActionButton.extended(
                backgroundColor: const Color(0xFF344E41),
                label: Row(children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 29.0,
                    semanticLabel:
                    'Text to announce in accessibility modes',
                  ),
                  Text("Back"),
                ],),
                onPressed: () {},

              ),
              body: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,

                      ),
                      titleWidget("Location Information"),
                      const SizedBox(
                        height: 30,

                      ),
                      Text(
                        "You must add this Location Information and Because will use .\n it in Donation Processes and Analysis",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      const SizedBox(
                        height: 60,

                      ),
                      Center(
                        child: Form(
                          key: _form534,
                          child:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                          FloatingActionButton.extended(
                            backgroundColor: const Color(0xFF344E41),
                            label: Row(children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 29.0,
                                semanticLabel:
                                'Text to announce in accessibility modes',
                              ),
                              Text("location"),
                            ],),
                            onPressed: () async {
                              // It returns true if the form is valid, otherwise returns false
                              if (_form534.currentState!.validate()) {
                                LatLng? location= await MyMap.getLocation();
                                if(location==null){
                                  showToast('must add Location if this message repeated go to settings to change permission',Colors.red,Colors.white);
                                }
                                else {
                                  print(location.latitude);
                                  print(location.longitude);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginForm()),
                                  );
                                  showToast('Successfully add Location',Colors.green,Colors.white);

                                }
                              }
                            },

                          ),


                              ]),
                        ),
                      ),

                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

