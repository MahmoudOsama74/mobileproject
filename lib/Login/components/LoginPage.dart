import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/Login/components/cbuilder.dart';
import 'package:mobileproject/shared/Constant/Constant.dart';
import 'package:mobileproject/shared/components/toast.dart';
import '../../Profile/UpdateProfile.dart';
import '../../Signup/components/signup_form.dart';
import '../already_have_an_account_acheck.dart';


import '../../constants.dart';

import '../../network/local/cache_helper.dart';
import 'constants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LoginForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.accessToken,
            ).then((value)
            {
              token = state.loginModel.accessToken;
              showToast("Successfully Login ",Colors.green,Colors.white);
            });
          }
          if(state is LoginErrorState){
            showToast(UNEXPECTEDERROR,Colors.red,Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40.0),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'WELCOME BACK !',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: username,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: CupertinoColors.systemGrey5,
                          onSaved: (email) {},
                          validator: (val) {
                            if (val!.isEmpty) return 'Required*';
                            if (RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(val)) {
                            } else {
                              return ("Invalid Email");
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: passwordController,
                          obscureText: true,
                          cursorColor: Colors.white70,
                          validator: (val) {
                            if (val!.isEmpty) return 'Required*';
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Your password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),



                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context){
                          return Hero(
                            tag: "login_btn",
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize: const Size(200, 50),
                                minimumSize: const Size(200, 50),
                              ),
                              onPressed: (){
                                if (formKey.currentState!.validate()) {
                                  //await LoginCubit.get(context).Temp();
                                  LoginCubit.get(context).userLogin(
                                    email: username.text,
                                    password: passwordController.text,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UpdateScreen()),
                                  );
                                }
                              },
                              child: Text(
                                "Login".toUpperCase(),
                              ),
                            ),
                          );
                        },
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),


                      const SizedBox(height: 20.0),
                      AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpForm();
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
          );
        },
      ),
    );
  }
}


