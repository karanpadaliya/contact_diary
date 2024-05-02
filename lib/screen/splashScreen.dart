import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0; // Initial opacity value for animation

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(
      Duration(seconds: 1), // Delay of 1 second before animation starts
          () {
            setState(() {
              _opacity = 1; // Set opacity to 1 to trigger animation
            });
            _startAnimation();
          },
    );

  }

  // Function to start the animation after a delay
  void _startAnimation() {
    Future.delayed(
      Duration(seconds: 8), // Delay of 1 second before animation starts
          () {
        Navigator.pushReplacementNamed(context, "SignIn");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // center round
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 3),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: CupertinoColors.link,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),

          // top Right round
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
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
          ),

          //bottamLeft round
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 4),
            child: Align(
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
          ),

          //center container
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedOpacity(
                    opacity: _opacity, // Use the opacity value for animation
                    duration: Duration(seconds: 5), // Duration of the animation
                    child: Image.asset(
                      "assets/images/logo2.png",
                      height: 100,
                      width: 100,
                      color: Colors.white,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedOpacity(
                    opacity: _opacity, // Use the opacity value for animation
                    duration: Duration(seconds: 5), // Duration of the animation
                    child: Text(
                      'Contact Diary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sedan',
                        wordSpacing: 2,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
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
