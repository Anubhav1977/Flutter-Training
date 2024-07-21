// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application/Ecommerce/Categorypage.dart';
import 'package:flutter_application/Category_assignment/Database.dart';
import 'package:flutter_application/Ecommerce/productdto.dart';
import 'Category_assignment/himanshu.dart';
import 'Ecommerce/BottomNavigation.dart';
import 'Ecommerce/Utility.dart';
import 'Ecommerce/ProductDesc.dart';
import 'Ecommerce/Cart.dart';
import 'Ecommerce/HomePage.dart';
import 'Ecommerce/class_test.dart/mainscreen.dart';
import 'Ecommerce/class_test.dart/adduser.dart';
import 'Ecommerce/class_test.dart/showuser.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDataBase().initializeDb();
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/Login": (context) => HomePageWidget(),
        "/productdesc": (context) => ProductDescWidget(),
        "/cart": (context) => CartWidget(),
        "/mainscreen": (context) => mainscreenwidget(),
        "/adduser": (context) => adduserwidget(),
        "/showuser": (context) => ShowUserWidget(),
      },
      home: BottomNav(),
    );
  }
}

