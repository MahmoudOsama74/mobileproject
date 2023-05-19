
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Login/components/cbuilder.dart';
import '../../shared/components/EmptyWidget.dart';
import '../../shared/components/toast.dart';
import '../Cubit/BusinessServiceStates.dart';
import '../Cubit/BussinessServiceCubit.dart';
import '../model/bServicesModel.dart';
import 'FavServicesCard.dart';
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
    return BlocProvider(
      create: (BuildContext context) => BusinessServiceCubit()..getAllFavorite(),
      child: BlocConsumer<BusinessServiceCubit,BusinessServiceStates>(
        listener: (context, state) {
          if (state is GetAllServiceSuccessState){
          }
          if(state is AddServiceToFavoriteSuccessState){
            showToast(state.addServiceToFavoriteModel.message,Colors.green,Colors.white);
          }
          if (state is GetAllServiceErrorState){
            showToast(state.error,Colors.red,Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            body:
            Column(
              children: [
                ConditionalBuilder(
                  condition: BusinessServiceCubit.get(context).getAllServiceModel!=null,
                  builder: (context)=>Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          favServicesCard(context,BusinessServiceCubit.get(context).getAllServiceModel?.services![index],scaffoldKey,index),
                      itemCount:BusinessServiceCubit.get(context).getAllServiceModel?.services?.length,
                    ),
                  ),
                  fallback: (context)=>noData("no Data","Business Services"),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}