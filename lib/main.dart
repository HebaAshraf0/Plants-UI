import 'package:flutter/material.dart';
import 'package:planet_ui/Modules/onboarding_screen.dart';
import 'package:planet_ui/Modules/root_screen.dart';
import 'package:planet_ui/Screens/home_screen.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
