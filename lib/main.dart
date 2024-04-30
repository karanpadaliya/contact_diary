import 'package:contact_diary/LoginPage/SignIn.dart';
import 'package:contact_diary/screen/homePage.dart';
import 'package:contact_diary/screen/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainPage());
}


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: "/",

      // Global text font style
      // theme: ThemeData(
      //   fontFamily: "Rubik",
      // ),
      routes: {
        "/": (context) => SplashScreen(),
        "HomePage": (context) => HomePage(),
        "SignIn": (context) => SignIn(),
        // "invoice": (context) => AddInvoice(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "onUnknownRoute",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}