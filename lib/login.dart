import 'package:loginpageui/Registereduser.dart';
import 'package:loginpageui/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottomnavigation.dart';

class LoginWidget extends StatefulWidget {
  // String? username;
  // String? password;
  // File? img;
  // LoginWidget(this.username, this.password, this.img);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String? username;
  String? email;

  loadData() async {
    username = await SharedPref().loadData("username");
    email = await SharedPref().loadData("email");
    setState(() {});
  }

  void initState() {
    loadData();
  }

  final _formkey = GlobalKey<FormState>();
  bool obscureText = true;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
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
                  padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
                  child: Flexible(
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Center(
                          child: Text(
                            "Enter your Details here",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: usernameController,
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor: Colors.purple,
                                    decoration: InputDecoration(
                                        hintText: "Email Address",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          // borderSide: BorderSide(),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        )),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter Email";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: obscureText,
                                    decoration: InputDecoration(
                                      hintText: "Username",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      // suffixIcon: IconButton(
                                      //   onPressed: () {
                                      //     setState(() {
                                      //       obscureText = !obscureText;
                                      //     });
                                      //   },
                                      //   icon: Icon(obscureText
                                      //       ? Icons.visibility_off
                                      //       : Icons.visibility),
                                      // ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter Username";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: isSelected,
                                        side: const BorderSide(
                                            width: 2, color: Colors.white),
                                        onChanged: (value) async {
                                          bool? islogin = await SharedPref()
                                              .logindata("islogin", value);
                                          setState(() {
                                            isSelected = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        "Keep me Logged in !!",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      onPressed: () {
                                        if (_formkey.currentState!.validate() &&
                                            email == usernameController.text &&
                                            username ==
                                                passwordController.text) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NavHome()));
                                        } else {
                                          final snackbar = const SnackBar(
                                            content: Text(
                                              "Invalid Entry",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.red,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbar);
                                        }
                                      },
                                      child: const Text(
                                        "Log in",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.black26),
                                          backgroundColor: Colors.transparent,
                                          minimumSize:
                                              const Size(double.infinity, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final snackbar = const SnackBar(
                                        content: Text(
                                            "Looks Like a Personal Issue :) ",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // top: MediaQuery.of(context).size.height * 0.7,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 550, 10, 10),
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
                      "Or Signup with",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Doesn't have an Account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Signup');
                          },
                          child: const Text(
                            "Sign up",
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
