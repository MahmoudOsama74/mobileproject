import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/MainComponents/InputFieldTest.dart';
import 'package:mobileproject/Profile/cubit/cubit.dart';
import 'package:mobileproject/Profile/cubit/states.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../MainComponents/ButtonBack.dart';
import '../shared/components/toast.dart';


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
    return BlocProvider(
      create: (BuildContext context) => UpdatePasswordCubit(),
      child: BlocConsumer<UpdatePasswordCubit,UpdateStates>(
        listener: (context, state) {
          if (state is UpdatePasswordSuccessState){
            showToast(state.updatePasswordModel.message,Colors.green,Colors.white);
            Navigator.pop(context);
          }
          if (state is UpdatePasswordErrorState){
            showToast(state.updatePasswordModel.message,Colors.red,Colors.white);
          }

        },
        builder: (context, state) {
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
                          inputFieldTestreset(_oldPassword,"Old Password",TextInputType.text,null),
                          inputFieldTestreset(_newPassword,"New Password",TextInputType.text,(val) {
                            if (val!.isEmpty) return 'Empty';

                            if (val.length >= 8) {} else {
                              return ("Invalid Password");
                            }
                            return null;
                          }),
                          inputFieldTestreset(_confirmPassword,"confirm Password",TextInputType.text,(val) {
                            if (val!.isEmpty) return 'Empty';
                            if (val != _confirmPassword.text) {
                              return 'Not Match Password';
                            }
                            return null;
                          }),


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
                                print('-------------------------------------------');
                                print(_oldPassword.text);
                                print(_newPassword.text);
                                print(_confirmPassword.text);
                                print('-------------------------------------------');
                                UpdatePasswordCubit.get(context).userUpdatePassword(
                                    old_password: _oldPassword.text,
                                    new_password: _newPassword.text,
                                    new_password_confirmation: _confirmPassword.text
                                );

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
        },
      ),
    );
  }
}
