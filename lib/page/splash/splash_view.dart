import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xo_game/page/auth/login/login_view.dart';

class SplashScreen extends StatelessWidget {
  static String routeName ="splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3) ,(){
      //Navigator
      Navigator.pushReplacementNamed(context, Login.routeName);
    });
    return Container(
      decoration: BoxDecoration(
       image: DecorationImage(image:AssetImage("assets/image/background.jpeg"),fit:BoxFit.cover),
      ),
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/image/splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}