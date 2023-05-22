
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
import 'AddService.dart';
import 'bServicesCard.dart';


class ServicesForCompany extends StatelessWidget {
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var _formKey101 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  IconData fabIcon2=Icons.add;
  var rng = Random();

  ServicesForCompany({required this.id,Key? key}) : super(key: key);
  int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BusinessServiceCubit()..getAllServiceOfCompany(id: id),
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
            appBar: AppBar(
                backgroundColor: const Color(0xFFFFFFFF),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF04342A)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Row(children:  const [
                  Text('Services for Company',
                    style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF04342A), ),
                  ),
                  Spacer(),
                ],)
            ),
            key: scaffoldKey,
            body:Column(
              children: [
                ConditionalBuilder(
                  condition: BusinessServiceCubit.get(context).serviceOfCompanyModel?.services!=null,
                  builder: (context)=>Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          bServicesCard(context,BusinessServiceCubit.get(context).serviceOfCompanyModel?.services![index],scaffoldKey,index),
                      itemCount:BusinessServiceCubit.get(context).serviceOfCompanyModel?.services?.length,
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
