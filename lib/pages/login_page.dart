import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login-image.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.accentColor),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Your Username",
                            labelText: "Username"),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Username cannot be Empty !";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be Empty !";
                          } else if (value.length < 8) {
                            return "Password length should be greater than 8";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () => movetoHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            alignment: Alignment.center,
                            height: 40,
                            width: changeButton ? 40 : 120,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
