import 'package:flutter/material.dart';
import 'package:loginpageui/Registereduser.dart';
// import 'package:loginpageui/LoginUI.dart';
import 'package:loginpageui/dashboard.dart';
import 'package:loginpageui/main.dart';
import 'package:loginpageui/sharedPreferences.dart';
// import 'package:loginpageui/sharedPreferences.dart';
import 'package:loginpageui/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavHome(),
    );
  }
}

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int currentIndex = 0;
  final pagecontroller = PageController();
  List<Widget> _navscreens = [
    DashWidget(),
    UserScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        children: [
          _navscreens[currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          setState(
            () {
              currentIndex = value;
            },
          ),
          pagecontroller.jumpToPage(value),
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              // color: Colors.white,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              // color: Colors.white,
            ),
            label: "User Details",
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                child: Icon(Icons.person),
              ),
              label: "Profile"),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Color(0xff7023f9),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  profileConatainer(IconData icon, String txt) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            // backgroundColor: Colors.transparent,
            child: Icon(icon),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            txt,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  String? username;
  String? email;
  String? address;
  String? phone;
  int? age;

  loadData() async {
    try {
      username = await SharedPref().loadData("username");
      email = await SharedPref().loadData("email");
      address = await SharedPref().loadData("address");
      phone = await SharedPref().loadData("phone");
      age = await SharedPref().loadData("age");
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            "PROFILE",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              Icons.settings_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(25, 65, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://us.123rf.com/450wm/hunmanart/hunmanart2301/hunmanart230100001/205186176-saint-petersburg-russia-january-21-2023-batman-icon-with-white-eyes-isolated-icon-flat-style-vector.jpg?ver=6"),
                ),
                Wrap(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Hello !\n",
                        children: [
                          TextSpan(
                              text: username != null
                                  ? "${username!.toUpperCase()}"
                                  : "--",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff7023f9),
                                  fontSize: 24))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color(0xff7023f9), Colors.purple]),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Center(
                child: Container(
                  height: 400,
                  width: 300,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "Profile Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      profileConatainer(
                          Icons.verified_user_outlined, "$username"),
                      profileConatainer(Icons.mail_outline_rounded, "$email"),
                      profileConatainer(
                          Icons.location_city_outlined, "$address"),
                      profileConatainer(Icons.call_outlined, "$phone"),
                      profileConatainer(Icons.person_outlined, "$age"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout -->"),
      ),
    );
  }
}

// Container(
//   height: MediaQuery.of(context).size.height,
//   width: MediaQuery.of(context).size.width,
//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//         colors: [Color(0xff7023f9), Colors.purple],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter),
//   ),
//   child: Column(
//     children: [
//       Container(
//         height: MediaQuery.of(context).size.height * 0.2,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.zero,
//         margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ListView.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 contentPadding: EdgeInsets.fromLTRB(6, 0, 8, 0),
//                 title: Text(
//                   "Firstname Lastname",
//                   style: TextStyle(
//                       color: Color(0xff0c9d11),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("College name"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text("TODO LIST"),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.all(10),
//                             backgroundColor: Colors.purple,
//                             foregroundColor: Colors.white,
//                             // minimumSize: ,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 4,
//                         ),
//                         OutlinedButton(
//                           onPressed: () {},
//                           child: Text("EDIT PROFILE"),
//                           style: OutlinedButton.styleFrom(
//                             padding: EdgeInsets.all(10),
//                             foregroundColor: Colors.purple,
//                             shadowColor: Colors.black,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 trailing: CircleAvatar(
//                   backgroundColor: Colors.purple,
//                   radius: 30,
//                   child: Icon(
//                     Icons.person,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             }),
//       ),
//       Container(
//         height: MediaQuery.of(context).size.height * 0.5,
//         margin: EdgeInsets.fromLTRB(40, 80, 40, 0),
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.edit,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "CONTRIBUTE",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.code,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "PRACTICE",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(37, 15, 37, 15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.cast_for_education,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "LEARN",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.interests,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "INTERESTES",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(37, 15, 37, 15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.help,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "HELP",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.purple,
//                           radius: 25,
//                           child: Icon(
//                             Icons.settings,
//                             size: 40,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "SETTINGS",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
