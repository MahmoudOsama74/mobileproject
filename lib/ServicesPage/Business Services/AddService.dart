import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/CustomAppBar.dart';
import '../../MainComponents/Button.dart';
import '../../MainComponents/InputFieldTest.dart';
import 'bServicesList.dart';


class AddService extends StatelessWidget {
  final TextEditingController _date16 = TextEditingController();
  final GlobalKey<FormState> _form15 = GlobalKey<FormState>();
  final TextEditingController BName = TextEditingController();
  final TextEditingController Bdiscription = TextEditingController();
  final TextEditingController location = TextEditingController();

  AddService({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                inputFieldTest(
                  BName, "Service Name", TextInputType.name, (val) {
                  if (val!.isEmpty) return 'Empty';
                  return null;
                },),
                inputFieldTest(
                  Bdiscription, "Service Description", TextInputType.name, (val) {
                  if (val!.isEmpty) return 'Empty';
                  return null;
                },),

                onPressedButton("Submit", (){
                  if (_form15.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BusinessServicesList();
                        },
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}