import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  getListdata(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getStringList(key);
  }

  getdata(String key, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  logindata(String key, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  getagedata(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("age", value);
  }

  loadData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key) ?? "No Data";
  }

  cleardata(dynamic key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  // cleardata(dynamic key) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove(key);
  // }
}

// class Sharedwidget extends StatefulWidget {
//   @override
//   State<Sharedwidget> createState() => _SharedwidgetState();
// }

// class _SharedwidgetState extends State<Sharedwidget> {
//   String? username;

//   loaddata() async {
//     String? loadusername = await SharedPref().savedata();
//     setState(() {
//       username = loadusername;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         children: [
//           TextButton(
//               onPressed: () async {
//                 await loaddata();
//                 setState(() {});
//               },
//               child: Text("load data")),
//           Text("$username"),
//           FloatingActionButton(
//             onPressed: () async {
//               await SharedPref().getdata("Anubhav");
//               setState(() {});
//             },
//           ),
//           TextButton(
//               onPressed: () async {
//                 await SharedPref().cleardata("Username");
//               },
//               child: Text("clear data")),
//         ],
//       )),
//     );
//   }
// }
