import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../network/local/cache_helper.dart';
import '../../Login/already_have_an_account_acheck.dart';
import '../../Login/components/LoginPage.dart';

import '../../MainComponents/InputFieldTest.dart';
import '../../Profile/CompanyProfile.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'Title.dart';

class SignUpForm extends StatelessWidget {
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
  List<bool> _isCheckedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
      return Material(
      child: SafeArea(
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
                    inputFieldTest(CnameController, "Company Name"),
                    inputFieldTest(PnameController, "Contact Person Name"),
                    inputFieldTest(emailController, "Email Address"),
                    inputFieldTest(phoneNumberController, "Phone Number"),
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
                                                  "One number\n"
                                                  "Uppercase letter\n"
                                                  "Lowercase letter\n"
                                                  "10 or more characters"),
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

                            if (val.length >= 10 &&
                                !val.contains(RegExp(r'\W')) &&
                                RegExp(r'\d+\w*\d+').hasMatch(val)) {
                            } else {
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
                      'Micro',
                      'Small',
                      'Mini',
                      'Large',]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Company Industry',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: screenWidth * 0.2),
                        Center(
                          child: ChangeNotifierProvider(
                            create: (_) => CheckboxProvider(),
                            child: Consumer<CheckboxProvider>(
                              builder: (context, checkboxProvider, _) =>
                                  Checkbox(
                                    value: checkboxProvider.isChecked,
                                    onChanged: (value) {
                                      checkboxProvider.isChecked =
                                          value ?? true;
                                    },
                                  ),
                            ),
                          ),
                        ),
                      ],
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
                            SignUpCubit.get(context).userSignUp(
                              username: CnameController.text,
                              phoneNumber: phoneNumberController.text,
                              name: CnameController.text,
                              role: 'user',
                              CIndustry: dropdownValue,
                              email: emailController.text,
                              password: passwordController.text,
                              age: int.parse("20"),
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
      ),
    );
  }
}


