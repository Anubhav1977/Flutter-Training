import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loginpageui/bottomnavigation.dart';
import 'package:loginpageui/sharedPreferences.dart';
import 'main.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  bool? islogin;

  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    SplashScreen();
    loadData();
  }

  loadData() async {
    islogin = await SharedPref().loadData("islogin");
    setState(() {});
  }

  void SplashScreen() async {
    File? _img;
    await Future.delayed(Duration(seconds: 3));
    if (islogin == true) {
      Navigator.pushReplacement(
          (context),
          MaterialPageRoute(
            builder: (context) => NavHome(),
          ));
    } else {
      Navigator.pushReplacement(
        (context),
        MaterialPageRoute(
          builder: (context) => LoginWidget(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Color(0xaced0909)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: animation.value,
            width: animation.value,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.network(
                "https://i.pinimg.com/originals/33/8c/c5/338cc5c01c06ef477b0c88c9983df677.png"),
          ),
        ],
      ),
    );
  }
}
