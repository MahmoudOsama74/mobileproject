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

class BusinessServicesList extends StatefulWidget {
  BusinessServicesList({Key? key}) : super(key: key);

  @override
  _BusinessServicesListState createState() => _BusinessServicesListState();
}

class _BusinessServicesListState extends State<BusinessServicesList> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey101 = GlobalKey<FormState>();
  final TextEditingController Cname = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  IconData fabIcon2 = Icons.add;
  var rng = Random();
  List<String> filterValues = [
    'IT Services and Support',
    'Web Design and Development',
    'Graphic Design and Branding',
    'Research and Analytics',
    'Advertising and Marketing',
    'Event Planning and Management',
  ];
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BusinessServiceCubit()..getAllService(),
      child: BlocConsumer<BusinessServiceCubit, BusinessServiceStates>(
        listener: (context, state) {
          if (state is GetAllServiceSuccessState) {}
          if (state is AddServiceToFavoriteSuccessState) {
            showToast(state.addServiceToFavoriteModel.message, Colors.green, Colors.white);
          }
          if (state is GetAllServiceErrorState) {
            showToast(state.error, Colors.red, Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton.small(
              heroTag: "baseXBtn1",
              elevation: 20,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Color(0xFF04342A),
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
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
                Container(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [

                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedFilter,
                          onChanged: (value) {
                            setState(() {
                              selectedFilter = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Search By',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 25),
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            const DropdownMenuItem<String>(
                              value: 'All',
                              child: Text('All'),
                            ),
                            ...filterValues.map((filter) {
                              return DropdownMenuItem<String>(
                                value: filter,
                                child: Text(filter),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ConditionalBuilder(
                  condition: BusinessServiceCubit.get(context).getAllServiceModel?.services != null,
                  builder: (context) => Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final service = BusinessServiceCubit.get(context).getAllServiceModel?.services![index];
                        if (selectedFilter == 'All' || service?.serviceName == selectedFilter) {
                          return bServicesCard(context, service, scaffoldKey, index);
                        } else {
                          return SizedBox(); // Return an empty container if the item doesn't match the selected filter
                        }
                      },

                      itemCount: BusinessServiceCubit.get(context).getAllServiceModel?.services?.length,
                    ),
                  ),
                  fallback: (context) => noData("no Data", "Business Services"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
