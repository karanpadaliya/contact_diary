import 'package:contact_diary/Provider/SignUpProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  //For Password Visible
  bool isPassword = true;

  TextEditingController UserNameController = TextEditingController();
  TextEditingController UserMobileNoController = TextEditingController();
  TextEditingController UserPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 500,
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
                    "SignUp",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  //Name
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: UserNameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLength: 25,
                      // maxLengthEnforcement: MaxLengthEnforcement.none,
                      decoration: InputDecoration(
                        label: Text("Name"),
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
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //MobileNo
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: UserMobileNoController,
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
                  ),
                  SizedBox(
                    height: 1,
                  ),

                  //pin
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: UserPinController,
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
                    onPressed: () {
                      String userName = UserNameController.text;
                      String mobileNo = UserMobileNoController.text;
                      String pin = UserPinController.text;

                      if (userName.isEmpty || mobileNo.isEmpty || pin.isEmpty) {
                        // Show error message if any field is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('All fields are required'),
                          ),
                        );
                      } else {
                        int mobileNoInt =
                            int.tryParse(mobileNo) ?? 0; // Handle invalid input
                        Provider.of<SignUpProvider>(context, listen: false)
                            .setUserDetails(userName, mobileNoInt, pin);
                        Navigator.pushNamed(context, "SignIn");
                      }

                      // // var intVal = int.tryParse(text);
                      // String userName = UserNameController.text;
                      //
                      // String MobileNo = UserMobileNoController.text;
                      // int mobileNo = int.parse(MobileNo).toInt();
                      //
                      // String Pin = UserPinController.text;
                      //
                      // Provider.of<SignUpProvider>(context, listen: false)
                      //     .setUserDetails(userName, mobileNo, Pin);
                      // // Navigator.pushNamed(context, "HomePage");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Submit",
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
                      Text("Have Account ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "SignIn");
                        },
                        child: Text("Login"),
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
        ],
      ),
    );
  }
}
