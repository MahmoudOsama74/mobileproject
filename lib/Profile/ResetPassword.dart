import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileproject/MainComponents/InputFieldTest.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../MainComponents/ButtonBack.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  ResetPasswordState createState() {
    return ResetPasswordState();
  }
}
class ResetPasswordState extends State<ResetPassword> {
  final _ResetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Material(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buttonBack(context),
              title(" ResetPassword"),
            ],
          ),

          Expanded(
            child:Form(
              key: _ResetPasswordFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child:Container(
                        height: 200.0,
                        width: 320.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/forgetPassword.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    inputFieldTest(_oldPassword,"Old Password",),
                    inputFieldTest(_newPassword,"New Password",),
                    inputFieldTest(_confirmPassword,"confirm Password",),

                    const SizedBox(height: 10 / 2),
                    Center(
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3E6864),
                            textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)
                        ),
                        child: const Text('Reset Password'),
                        onPressed: () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.custom,
                            barrierDismissible: true,
                            confirmBtnText: 'Save',
                            customAsset: 'assets/images/OOO.jpeg',

                            widget:TextField(
                              controller: _oldPassword,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Enter Confirmation code From Gmail",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Icon(Icons.code),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF3F5F3),
                              ),

                            ),


                          );
                          title: 'Custom';
                          text: 'Custom Widget Alert';
                          leadingImage: 'assets/custom.gif';
                        },
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
* Form(
      key: _ResetPasswordFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child:Container(
                height: 200.0,
                width: 220.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/forgetPassword.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal:5),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                  controller: _oldPassword,
                  decoration: const InputDecoration(
                    hintText: "Old Password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.password_outlined),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFB2DFDB),
                  ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal:5),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _newPassword,
                decoration: const InputDecoration(
                  hintText: "New Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(Icons.password_outlined),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal:5),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _confirmPassword,
                decoration: const InputDecoration(
                  hintText: "confirm Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(Icons.password_outlined),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
              ),
            ),
            //ElevatedButton
            const SizedBox(height: 10 / 2),
            Center(
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3E6864),
                    textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)
                ),
                child: const Text('Reset Password'),
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.custom,
                    barrierDismissible: true,
                    confirmBtnText: 'Save',
                    customAsset: 'assets/images/FFF.jpg',

                    widget:TextField(
                        controller: _oldPassword,
                      keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter Confirmation code From Gmail",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(Icons.code),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFF3F5F3),
                        ),

                        ),


                  );
                  title: 'Custom';
                  text: 'Custom Widget Alert';
                  leadingImage: 'assets/custom.gif';
                },
              ),

            ),
          ],
        ),
      ),
    );*/