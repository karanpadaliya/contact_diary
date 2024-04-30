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
              height: 200,
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
          Container(
            height: 400,
            width: 330,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.link.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "SignIn",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  decoration: InputDecoration(
                    label: Text("Mobile No"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    counterText: '', // use is not visible maxLength in UI
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.password),
                    label: Text("Pin"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                FilledButton(
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(10),
                    backgroundColor:
                    MaterialStatePropertyAll(CupertinoColors.link),
                  ),
                  onPressed: () {},
                  child: Text("SignIn"),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                Row(
                  children: [
                    Text("Create Account"),
                    TextButton(
                      onPressed: () {},
                      child: Text("SignUp"),
                    ),
                    // RotatedBox(
                    //   quarterTurns: 1,
                    //   child: Divider(
                    //     thickness: 2,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1,right: 10),
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
        ],
      ),
    );
  }
}
