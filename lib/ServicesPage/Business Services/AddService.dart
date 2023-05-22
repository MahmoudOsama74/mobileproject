import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/ServicesPage/Cubit/BussinessServiceCubit.dart';
import '../../../shared/components/CustomAppBar.dart';
import '../../MainComponents/Button.dart';
import '../../MainComponents/InputFieldTest.dart';
import '../../shared/components/toast.dart';
import '../Cubit/BusinessServiceStates.dart';
import 'bServicesList.dart';


class AddService extends StatelessWidget {
  final TextEditingController _date16 = TextEditingController();
  final GlobalKey<FormState> _form15 = GlobalKey<FormState>();
  final TextEditingController BName = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  final TextEditingController location = TextEditingController();
  String dropdownValue1 = 'IT Services and Support';
  AddService({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BusinessServiceCubit(),
      child: BlocConsumer<BusinessServiceCubit,BusinessServiceStates>(
        listener: (context, state) {
          if (state is CreateServiceSuccessState){
            showToast(state.createServiceModel.message,Colors.green,Colors.white);
            Navigator.pop(context);
          }
          if (state is CreateServiceErrorState){
            showToast(state.error,Colors.red,Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: basicAppBar('Add Service'),
            body: SingleChildScrollView(
              child: Form(
                key: _form15,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: DropdownButtonFormField(
                          decoration:  const InputDecoration(
                            labelText: "Service Name  \n",
                            labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                          dropdownColor: Colors.white,
                          value: dropdownValue1,
                          onChanged: (String? newValue2) {
                            dropdownValue1 = newValue2!;
                          },
                          items:[
                            'IT Services and Support',
                            'Web Design and Development',
                            'Graphic Design and Branding',
                            'Research and Analytics',
                            'Advertising and Marketing',
                            'Event Planning and Management',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 18, color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      inputFieldTest(
                        Bdiscription, "Service Description", TextInputType.name, (val) {
                        if (val!.isEmpty) return 'Empty';
                        return null;
                      },),

                      onPressedButton("Submit", (){
                        if (_form15.currentState!.validate()) {
                          print(dropdownValue1);
                          print(Bdiscription.text);
                          BusinessServiceCubit.get(context).createService(
                              name: dropdownValue1.toString(),
                              description: Bdiscription.text.toString()
                          );
                          BusinessServiceCubit.get(context).getAllService();
                          Navigator.pop(context);
                        }
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );

  }
}
