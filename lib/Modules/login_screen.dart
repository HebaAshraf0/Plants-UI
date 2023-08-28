import 'package:flutter/material.dart';
import 'package:planet_ui/Shared/Components/constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page'
        ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
