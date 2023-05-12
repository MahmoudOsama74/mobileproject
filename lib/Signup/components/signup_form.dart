import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../network/local/cache_helper.dart';
import '../../Login/already_have_an_account_acheck.dart';
import '../../Login/components/LoginPage.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../MainComponents/InputFieldTest.dart';
import '../../Profile/CompanyProfile.dart';
import '../Model/UserRegister.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'LocationCompelete.dart';
import 'Title.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var CnameController = TextEditingController();
  var PnameController = TextEditingController();
  var CindustryController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  FilePickerResult? result;
  late String text;
  late bool value;
  String dropdownValue = 'Micro';
  String? selectedValue;
  String x="";
  List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  children: [
                  const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                child: Row(
                  children: [titleWidget("Sign Up")],
                ),
              ),
              inputFieldTest(
                CnameController, "Company Name", TextInputType.name, (val) {
                if (val!.isEmpty) return 'Empty';
                return null;
              },),
              inputFieldTest(
                PnameController, "Contact Person Name", TextInputType.name, (
                  val) {
                if (val!.isEmpty) return 'Empty';
                return null;
              },),
              inputFieldTest(emailController, "Email Address",
                  TextInputType.emailAddress, (val) {
                    if (val!.isEmpty) return 'Empty';
                    if (RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(val)) {} else {
                      return ("Invalid Email");
                    }
                    return null;
                  }),
              inputFieldTest(
                phoneNumberController, "Phone Number", TextInputType.phone, (
                  val) {
                if (val!.isEmpty) return 'Empty';
                return null;
              },),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: Tooltip(
                          message: 'Hint !',
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: Text(
                                        "Your password must contain at least \n"
                                            "Number\n"
                                            "Uppercase letter\n"
                                            "Lowercase letter\n"
                                            "8 or more characters"),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.lightbulb),
                          )),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) return 'Empty';

                      if (val.length >= 8 &&
                          !val.contains(RegExp(r'\W')) &&
                          RegExp(r'\d+\w*\d+').hasMatch(val)) {} else {
                        return ("Invalid Password");
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: TextFormField(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Confirm password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) return 'Empty';
                      if (val != confirmPasswordController.text) {
                        return 'Not Match Password';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20.0),
              dropDownInputFieldTest('Company Size', dropdownValue, [
                'None',
                'Micro',
                'Small',
                'Mini',
                'Large',
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company Industry:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: MultiSelectDialogField(
                        buttonText: const Text('Select Options'),
                        title: Text('Options'),
                        items: items.map((item) => MultiSelectItem(item, item))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (selectedValues) {
                          setState(() {
                            selectedItems = selectedValues;
                          });
                        },

                      ),

                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        print('Selected items: $selectedItems');

                        for (String item in selectedItems) {
                          x += '$item,';
                          // Do something with x

                        }
                        // x+=item;
                        print(x);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Hero(
                tag: "login_btn",
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(200, 50),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      /*SignUpCubit.get(context).userSignUp(
                                  name: CnameController.text,
                                  contact_person_name: PnameController.text,
                                  contact_person_phone_number: phoneNumberController.text,
                                  email: emailController.text,
                                  company_address: dropdownValue,
                                  company_size: Provider.of<CheckboxProvider>(context, listen: false).isChecked.toString(),
                                  password: passwordController.text,
                                  password_confirmation: confirmPasswordController.text
                              );*/

                      UserRegister userRegister = UserRegister(
                          CnameController.text.toString(),
                          PnameController.text.toString(),
                          phoneNumberController.text.toString(),
                          emailController.text.toString(),
                          dropdownValue,
                          x,
                          passwordController.text.toString(),
                          confirmPasswordController.text.toString(),


                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            LocationForUser(userRegister: userRegister,)),
                      );
                    }
                  },
                  child: Text(
                    "Sign UP".toUpperCase(),
                  ),
                ),
              ),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginForm();
                        },
                      ),
                    );
                  },
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


