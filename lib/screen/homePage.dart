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
        title: Consumer<SignUpProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Text('Welcome! ${value.userName ?? "No name"}');
          },
        ),
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.systemGroupedBackground,
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
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: 270,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CupertinoColors.link,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   backgroundColor: CupertinoColors.link,
      //   foregroundColor: CupertinoColors.systemGroupedBackground,
      //   child: Icon(Icons.person_add_alt_1),
      // ),
    );
  }
}
