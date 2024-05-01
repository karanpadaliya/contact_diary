import 'package:contact_diary/DrawerPageScreen/ProfilePage.dart';
import 'package:contact_diary/LoginPage/SignIn.dart';
import 'package:contact_diary/LoginPage/SignUp.dart';
import 'package:contact_diary/Provider/SignUpProvider.dart';
import 'package:contact_diary/screen/homePage.dart';
import 'package:contact_diary/screen/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider())
      ],
      child: MaterialApp(
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
          "SignUp": (context) => SignUp(),
          "ProfilePage": (context) => ProfilePage(),
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
      ),
    );
  }
}