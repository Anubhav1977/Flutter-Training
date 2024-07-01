import 'package:flutter/material.dart';
import 'package:loginpageui/login.dart';
import 'package:loginpageui/splashScreen.dart';
import 'bottomnavigation.dart';
import 'Signup.dart';
import 'Registereduser.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/Login": (context) => LoginWidget(),
          "/Signup": (context) => SignupWidget(),
          "/Dashboard": (context) => NavHome(),
        },
        home: UserScreen());
  }
}
