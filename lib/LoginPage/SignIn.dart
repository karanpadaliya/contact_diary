import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //For Password Visible
  bool isPassword = true;

  void isPasswordVisibility() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // top Right round
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(250)),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.link,
                    blurRadius: 50,
                    spreadRadius: 55,
                  )
                ],
              ),
            ),
          ),

          // bottom Left round
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.link,
                    blurRadius: 50,
                    spreadRadius: 55,
                  )
                ],
                borderRadius: BorderRadius.only(topRight: Radius.circular(200)),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 400,
              width: 330,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CupertinoColors.link.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: CupertinoColors.systemGrey.withOpacity(0.5),
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "LogIn",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 10,
                    // maxLengthEnforcement: MaxLengthEnforcement.none,
                    decoration: InputDecoration(
                      label: Text("Mobile No"),
                      counterText: '', // use is not visible maxLength in UI
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CupertinoColors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    maxLength: 4,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        child: Icon(isPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      label: Text("Pin"),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CupertinoColors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                      backgroundColor:
                          MaterialStatePropertyAll(CupertinoColors.link),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "LogIn",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.login),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Create Account"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "SignUp");
                        },
                        child: Text("SignUp"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 10),
                        child: Container(
                          height: 30,
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Text("Need Help"),
                      Icon(Icons.info_outline),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
