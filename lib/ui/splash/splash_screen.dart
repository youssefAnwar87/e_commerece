import 'dart:async';

import 'package:e_commerece/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  static const String routeName = "splash screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration (seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset("assets/images/Splash Screen.png",
      fit:  BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
