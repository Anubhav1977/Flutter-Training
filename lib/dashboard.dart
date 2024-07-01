import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loginpageui/sharedPreferences.dart';
import 'main.dart';
import 'bottomnavigation.dart';

class DashboardWidget extends StatefulWidget {
  String? text;
  File? img;
  DashboardWidget(this.text, this.img);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.power_settings_new),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      //
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff7023f9), Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.fromLTRB(6, 0, 8, 0),
                          title: Text(
                            widget.text ?? "Firstname Lastname",
                            style: TextStyle(
                                color: Color(0xff0c9d11),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("College name"),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("TODO LIST"),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: Colors.purple,
                                      foregroundColor: Colors.white,
                                      // minimumSize: ,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text("EDIT PROFILE"),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.all(10),
                                      foregroundColor: Colors.purple,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
