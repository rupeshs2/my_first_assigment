import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_first_assigment/View/home_page.dart';
import 'package:my_first_assigment/View/registration_page.dart';

class LoginPage extends StatefulWidget {
  final String name, email, passWord;
  const LoginPage(
      {super.key,
      required this.name,
      required this.email,
      required this.passWord});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormState>();
  String loginEmail = "";
  String loginPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "images/login.svg",
                  height: 150,
                ),
                const Center(
                  child: Text(
                    'Login with Email',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter your email',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return validateEmail(value.toString());
                        },
                        onChanged: (val) {
                          setState(() {
                            loginEmail = val;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter your Password',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        maxLength: 8,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          } else if (value.length != 8) {
                            return "Minimum 8 chars";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            loginPassword = val;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: GestureDetector(
          onTap: () {
            if (loginFormKey.currentState!.validate()) {
              if (loginEmail != widget.email ||
                  loginPassword != widget.passWord) {
                Get.snackbar(
                  "",
                  "",
                  backgroundColor: Colors.red.withOpacity(0.9),
                  titleText: const Text(
                    "Error",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  messageText: const Text(
                    "Invalid Credentials",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                );
              } else {
                Get.snackbar(
                  "",
                  "",
                  backgroundColor: Colors.green.withOpacity(0.9),
                  titleText: const Text(
                    "Success",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  messageText: const Text(
                    "Login Succes",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                );
                log("Ready to go");
                Get.offAll(
                  () => HomePage(name: widget.name),
                );
              }
            }
          },
          child: Container(
            height: 50,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
