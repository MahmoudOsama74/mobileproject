import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 20,
              color: Color(0xFF344E41),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 80.0),
      ],
    );
  }
}
