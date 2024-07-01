import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginpageui/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashWidget extends StatefulWidget {
  @override
  State<DashWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.line_style_rounded, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.mail_outline_outlined, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.call_end_rounded, color: Colors.white),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  await SharedPref().cleardata("islogin");
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.exit_to_app_outlined,
                  color: Colors.white,
                )),
          ],
          title: const Center(
              child: Text(
            "User Info",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'appbarf',
                fontWeight: FontWeight.bold),
          )),
          backgroundColor: Color(0xff7023f9),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff7023f9), Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: UserService().getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<UserDto> userlist = snapshot.data;
                return ListView.builder(
                    itemCount: userlist.length,
                    itemBuilder: (context, index) {
                      return UserWidget(userdto: userlist[index]);
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class UserService {
  Future getdata() async {
    String res = await rootBundle.loadString('assets/mock_json.json');
    Map<String, dynamic> jsondatamap = jsonDecode(res);
    List<dynamic> _data = jsondatamap['users'];
    List<UserDto> userlist = [];

    _data.forEach((element) {
      Map<String, dynamic> _usermap = element;

      AddressModel addressModel = AddressModel(
        street: _usermap['address']['street'],
        suite: _usermap['address']['suite'],
        city: _usermap['address']['city'],
        zipcode: _usermap['address']['zipcode'],
      );

      CompanyModel companyModel = CompanyModel(
        cname: _usermap['name'],
        catchphrase: _usermap['catchphrase'],
        bs: _usermap['bs'],
      );

      UserDto _userdto = UserDto(
        id: _usermap['id'],
        name: _usermap['name'],
        username: _usermap['username'],
        email: _usermap['email'],
        phone: _usermap['phone'],
        website: _usermap['website'],
        address: addressModel,
        company: companyModel,
      );
      userlist.add(_userdto);
    });
    return userlist;
  }
}

class UserDto {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  AddressModel? address;
  CompanyModel? company;

  UserDto({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
    this.company,
  });
}

class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });
}

class CompanyModel {
  String? cname;
  String? catchphrase;
  String? bs;

  CompanyModel({
    this.cname,
    this.catchphrase,
    this.bs,
  });
}

class UserWidget extends StatefulWidget {
  UserDto? userdto;

  UserWidget({this.userdto});
  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  UserDto? userdto;
  @override
  Widget build(BuildContext context) {
    userdto = widget.userdto;
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                // color: Color(0xFFcbf3f0),
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (10)),
                    child: Text(
                      "User id : ${userdto?.id}",
                      style: const TextStyle(
                          fontFamily: 'semib',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: Center(
                      child: Text("${userdto?.username}",
                          style: const TextStyle(
                              fontFamily: 'semib', fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class UserDetails extends StatelessWidget {
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  String? lat;
  String? lng;
  String? company;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? _userdata =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    name = _userdata?['name'];
    username = _userdata?['username'];
    email = _userdata?['email'];
    phone = _userdata?['phone'];
    website = _userdata?['website'];
    suite = _userdata?['suite'];
    street = _userdata?['street'];
    city = _userdata?['city'];
    zipcode = _userdata?['zipcode'];
    lat = _userdata?['lat'];
    lng = _userdata?['lng'];
    company = _userdata?['company'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFcbf3f0),
        title: Text(
          "${name}",
          style: TextStyle(
              fontFamily: 'dance', fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: const Color(0xFF2ec4b6),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "User Name : ${username}",
                style: const TextStyle(
                    fontFamily: 'appbarf',
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFeaf4f4),
                border: Border.all(width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Street : ${street} \nSuite : ${suite} \nCity : ${city} \nZipcode : ${zipcode}",
                style: const TextStyle(
                    fontFamily: 'appbarf',
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFeaf4f4),
                border: Border.all(width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Email Id : ${email} \nPhone : ${phone} \nWebsite : ${website} \ncompany : ${company}",
                style: const TextStyle(
                    fontFamily: 'appbarf',
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFeaf4f4),
                border: Border.all(width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class UserService {
// //   Future getdata(String userName, String pass) async {
// //     String str = await rootBundle.loadString('assets/mock_json.json');
// //     Map<String, dynamic> jsondatamap = jsonDecode(str);

// //     Map<String, dynamic> jsondata = jsondatamap['users'].firstWhere(
// //         (element) =>
// //             element['username'] == userName && element['password'] == pass,
// //         orElse: () => Null);

// //     if (jsondata != Null) {
// //       return UserModel(
// //         statuscode: Statuscode.SUCCESS,
// //         message: "Login Successs....",
// //         userdto: Userdto(
// //           id: jsondata['id'],
// //           username: jsondata['username'],
// //           email: jsondata['email'],
// //           password: jsondata['password'],
// //           full_name: jsondata['full_name'],
// //           age: jsondata['age'],
// //           gender: jsondata['gender'],
// //           address: AddressModel(
// //             street: jsondata['address']['street'],
// //             city: jsondata['address']['city'],
// //             state: jsondata['address']['state'],
// //             country: jsondata['address']['country'],
// //             zip_code: jsondata['address']['zip_code'],
// //           ),
// //         ),
// //       );
// //     } else {
// //       UserModel(
// //         statuscode: Statuscode.FAILED,
// //         message: "Login Denied !!",
// //       );
// //     }
// //   }
// // }

// // enum Statuscode {
// //   SUCCESS,
// //   FAILED,
// //   USER_NOT_FOUND,
// // }

// // class UserModel {
// //   String? message;
// //   Userdto? userdto;
// //   Statuscode? statuscode;

// //   UserModel({this.message, this.userdto, this.statuscode});
// // }

// // class Userdto {
// //   int? id;
// //   String? username;
// //   String? email;
// //   String? password;
// //   String? full_name;
// //   int? age;
// //   String? gender;
// //   AddressModel? address;
// //   // phonenumber? phonenumber;

// //   Userdto(
// //       {this.id,
// //       this.username,
// //       this.email,
// //       this.password,
// //       this.full_name,
// //       this.age,
// //       this.gender,
// //       this.address});
// // }

// // class AddressModel {
// //   String? street;
// //   String? city;
// //   String? state;
// //   String? country;
// //   String? zip_code;

// //   AddressModel(
// //       {this.street, this.city, this.state, this.country, this.zip_code});
// // }
