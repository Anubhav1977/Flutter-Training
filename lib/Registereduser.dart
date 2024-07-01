import 'dart:html';
import 'package:flutter/material.dart';
import 'sharedPreferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Map<String, dynamic>> userList = [];
  List<bool> isExpanded = [];

  Future saveUserData() async {
    try {
      SharedPref prefs = SharedPref();
      final username = await prefs.loadData("username");
      final email = await prefs.loadData("email");
      final address = await prefs.loadData("address");
      final phone = await prefs.loadData("phone");
      final age = await prefs.loadData("age");

      Map<String, dynamic> userMap = {
        "username": username,
        "email": email,
        "address": address,
        "phone": phone,
        "age": age,
      };
      setState(() {
        userList = [userMap];
        isExpanded = List<bool>.filled(userList.length, false);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void initState() {
    saveUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Deatils"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isSelected) {
              setState(() {
                isExpanded[panelIndex] = isSelected;
              });
            },
            children: userList.map((panel) {
              int index = userList.indexOf(panel);
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://us.123rf.com/450wm/hunmanart/hunmanart2301/hunmanart230100001/205186176-saint-petersburg-russia-january-21-2023-batman-icon-with-white-eyes-isolated-icon-flat-style-vector.jpg?ver=6"),
                      ),
                      title: Text("${panel['username']}"),
                    );
                  },
                  body: ListTile(
                    title: Text("User ${panel['username']} Details : \n"),
                    subtitle: Column(
                      children: [
                        Text("Email Id : ${panel['email']}"),
                        Text("Address : ${panel['address']}"),
                        Text("Age : ${panel['age']}"),
                      ],
                    ),
                  ),
                  isExpanded: isExpanded[index]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
