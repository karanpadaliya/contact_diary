import 'dart:convert';

import 'package:contact_diary/Provider/SignUpProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.systemGroupedBackground,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text("KP"),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: CupertinoColors.link,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('path_to_your_image.jpg'),
                    // You can also use NetworkImage for images from the internet
                    // backgroundImage: NetworkImage('url_to_your_image.jpg'),
                  ),
                  SizedBox(height: 8.0),
                  Consumer<SignUpProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        '${value.userName ?? "No name"}',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontFamily: "Sedan",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              // subtitle: Text('Change Your Profile'),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "ProfilePage");
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your logic here
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SignUpProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome!!",
                    style: titleStyle(
                      fSize: 20.00,
                    ),
                  ),
                  TextSpan(
                    text: "\n${value.userName ?? "No name"}",
                    style: titleStyle(
                      fSize: 30.0,
                      fFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.white,
        child: Icon(CupertinoIcons.person_badge_plus_fill),
        onPressed: (){
          Navigator.pushNamed(context, "AddContact");
        },
      ),
    );
  }

  TextStyle titleStyle(
      {color, fSize, fWeight, wordSpace, fFamily, letterSpace}) {
    return TextStyle(
      color: Colors.black,
      fontSize: fSize,
      fontWeight: fWeight,
      wordSpacing: wordSpace,
      fontFamily: fFamily,
      letterSpacing: letterSpace,
    );
  }
}
