// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'sharedPreferences.dart';

class SignupWidget extends StatefulWidget {
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final datecontroller = TextEditingController();
  DateTime? pickdate;
  String? date;
  int? age;

  // final passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool obscureText = true;
  bool isSelected = false;
  File? _image;

  Future pickimg() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (img != null) {
        _image = File(img.path);
      } else {
        print("Invalid Image");
      }
    });
  }

  getData() async {
    SharedPref sharedprefs = SharedPref();

    // Map<String, dynamic> usersmap = {
    //   'username': usernameController.text,
    //   'email': emailController.text,
    //   'address': addressController.text,
    //   'phone': phoneController.text,
    // };
    await sharedprefs.getListdata("users");
    await sharedprefs.getdata("username", usernameController.text);
    await sharedprefs.getdata("email", emailController.text);
    await sharedprefs.getdata("address", addressController.text);
    await sharedprefs.getdata("phone", phoneController.text);
  }

  calAge(DateTime pickdate) {
    age = DateTime.now().difference(pickdate).inDays ~/ 365;
    SharedPref().getagedata(age!);
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.78,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
                gradient: LinearGradient(
                    colors: [Color(0xff7023f9), Colors.purple],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: CircleAvatar(
                        radius: 40,
                        child: _image == null
                            ? IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                            height: 150,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      pickimg();
                                                    },
                                                    icon: CircleAvatar(
                                                      radius: 40,
                                                      child: Icon(Icons
                                                          .camera_alt_outlined),
                                                    )),
                                                IconButton(
                                                    onPressed: () {
                                                      pickimg();
                                                    },
                                                    icon: CircleAvatar(
                                                      radius: 40,
                                                      child: Icon(
                                                          Icons.photo_sharp),
                                                    )),
                                              ],
                                            ));
                                      });
                                },
                                icon: const Icon(FontAwesomeIcons.edit),
                              )
                            : null,
                        backgroundImage: _image != null
                            ? FileImage(File(_image!.path))
                            : null,
                      )),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        // color: Colors.red,
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: usernameController,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.purple,
                                decoration: InputDecoration(
                                    hintText: "Enter Username",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a username";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.purple,
                                decoration: InputDecoration(
                                    hintText: "Enter your Email",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a email";
                                  }
                                  return null;
                                },
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // TextFormField(
                              //   controller: passwordcontroller,
                              //   obscureText: obscureText,
                              //   decoration: InputDecoration(
                              //     hintText: "Enter Password",
                              //     filled: true,
                              //     fillColor: Colors.white,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(40),
                              //     ),
                              //     suffixIcon: IconButton(
                              //       onPressed: () {
                              //         setState(() {
                              //           obscureText = !obscureText;
                              //         });
                              //       },
                              //       icon: Icon(obscureText
                              //           ? Icons.visibility_off
                              //           : Icons.visibility),
                              //     ),
                              //   ),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Please enter a password";
                              //     }
                              //     return null;
                              //   },
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phoneController,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.purple,
                                decoration: InputDecoration(
                                    hintText: "Enter your Contact Number",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: addressController,
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.purple,
                                decoration: InputDecoration(
                                    hintText: "Enter your Address",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(40),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a Address";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // TextFormField(
                              //   controller: datecontroller,
                              //   style: const TextStyle(color: Colors.black),
                              //   mouseCursor: MaterialStateMouseCursor.clickable,
                              //   cursorColor: Colors.purple,
                              //   readOnly: true,
                              //   decoration: InputDecoration(
                              //       icon: Icon(
                              //         Icons.date_range_outlined,
                              //         color: Colors.white,
                              //       ),
                              //       hintText: "Enter DOB",
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(40),
                              //       )),
                              //   onTap: ()

                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Please enter a Phone Number";
                              //     }
                              //     return null;
                              //   },
                              // ),
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 10, 0),
                                      onPressed: () async {
                                        pickdate = await showDatePicker(
                                          context: context,
                                          lastDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          initialDate: DateTime.now(),
                                          helpText: "Select Your Date of Birth",
                                        );
                                        date = DateFormat('yMMMMd')
                                            .format(pickdate!);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    date != null
                                        ? Text(date!)
                                        : Text(
                                            "Select your DOB",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    date != null
                                        ? Text("${calAge(pickdate!)}")
                                        : Text(""),
                                  ],
                                ),
                              ),

                              // TextFormField(
                              //   controller: ageController,
                              //   style: const TextStyle(color: Colors.black),
                              //   cursorColor: Colors.purple,
                              //   decoration: InputDecoration(
                              //       hintText: "Enter Age",
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       border: OutlineInputBorder(
                              //         // borderSide: BorderSide(),
                              //         borderRadius: BorderRadius.circular(40),
                              //       )),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Please enter a Age";
                              //     } else if (int.parse(value) < 18) {
                              //       return "Access Denied Age < 18";
                              //     }
                              //     return null;
                              //   },
                              // ),

                              Row(
                                children: [
                                  Checkbox(
                                      value: isSelected,
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xff7023f9),
                                      mouseCursor:
                                          MaterialStateMouseCursor.clickable,
                                      onChanged: (value) {
                                        setState(() {
                                          isSelected = value!;
                                        });
                                      }),
                                  const Text(
                                    "Agree to the Terms and Conditions",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff7023f9),
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await getData();
                                      if (_formkey.currentState!.validate()) {
                                        // Future delay() async {
                                        //   await Future.delayed(
                                        //       Duration(seconds: 2));
                                        // }

                                        Navigator.pushNamed(context, '/Login');
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.black26),
                                      backgroundColor: Colors.transparent,
                                      minimumSize: const Size(50, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 210,
            //   left: 100,
            //   right: 100,
            //   child:
            // ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 600, 10, 10),
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                // color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      " Or Signup with ",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: Color(0xff7023f9),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.twitter,
                                color: Color(0xff7023f9))),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.facebook,
                                color: Color(0xff7023f9))),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.github,
                                color: Color(0xff7023f9))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an Account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Login');
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff7023f9)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SignupWidget extends StatefulWidget {
//   @override
//   State<SignupWidget> createState() => _SignupWidgetState();
// }

// class _SignupWidgetState extends State<SignupWidget> {
//   final _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.black, Colors.blue],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(8, 40, 10, 0),
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color(0x84e7d8d8),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Company ",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'roboto'),
//                       ),
//                       Text(
//                         "Logo",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontFamily: 'roboto',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
//               child: Text(
//                 "lOREM RKWFB WRRFIJWBRF WREFJIWBRFJ WERJIFB ERGET",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontFamily: 'roboto',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         labelStyle: TextStyle(
//                             color: Colors.white, fontFamily: 'roboto'),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please Enter an Email id';
//                         } else if (!RegExp(
//                                 r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
//                             .hasMatch(value)) {
//                           return 'Please Enter a valid Email id';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "Username",
//                         labelStyle: TextStyle(
//                             color: Colors.white, fontFamily: 'roboto'),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please Enter a Username';
//                         } else if (!RegExp(r'^[a-z A-Z 0-9]$')
//                             .hasMatch(value)) {
//                           return 'Please Enter a valid Username';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         labelStyle: TextStyle(
//                             color: Colors.white, fontFamily: 'roboto'),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.grey,
//                             width: 4,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please Enter a Password';
//                         } else if (!RegExp(
//                                 r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#_$%]).{8,16}$')
//                             .hasMatch(value)) {
//                           return 'Please Enter a valid Password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formkey.currentState!.validate()) {
//                         print("Correct data is entered");
//                       }
//                     },
//                     onLongPress: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "CREATE ACCOUNT",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: 'roboto'),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       // primary: Color.fromRGBO(255, 255, 255, 0.4),
//                       minimumSize: Size(290, 60),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
