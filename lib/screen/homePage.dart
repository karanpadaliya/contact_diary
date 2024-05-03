import 'dart:convert';

import 'package:contact_diary/Provider/ContactProvider.dart';
import 'package:contact_diary/Provider/SignUpProvider.dart';
import 'package:contact_diary/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  int? index;

  HomePage({super.key, this.index});

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
            child: PopupMenuButton(
              child: Icon(
                CupertinoIcons.person_crop_circle,
                size: 30,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person_pin_outlined,
                            color: Colors.black,
                          ),
                          title: Text("Profile"),
                          onTap: () {
                            Navigator.pushNamed(context, "ProfilePage");
                          },
                          // trailing: Icon(CupertinoIcons.right_chevron),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                          ),
                          title: Text("Logout"),
                          onTap: () async {
                            var instance = await SharedPreferences.getInstance();
                            instance.setBool("isLogin", false);
                            Navigator.pushReplacementNamed(context, "SignIn");
                          },
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          )
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
      body: Consumer<ContactProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            itemCount: value.contactList.length,
            itemBuilder: (context, index) {
              ContactModel contact = value.contactList[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${contact.Contact_name}"[0].toUpperCase()),
                ),
                title: Text(contact.Contact_name ?? "Contact_Name_Not_Found"),
                subtitle: Text(
                    contact.Contact_mobileNo ?? "Contact_MobileNo_Not_Found"),
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "tel: ${value.contactList[index].Contact_mobileNo}"));
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
                              ),
                              Text("Call"),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(
                                "sms: ${value.contactList[index].Contact_mobileNo}"));
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.message,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("Message"),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            String con =
                                'Please Use this number ${value.contactList[index].Contact_name ?? "Contact_Name_NotFound"},${value.contactList[index].Contact_mobileNo ?? "Mobile_Number_NotFound"} ';
                            Share.share(con);
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                ),
                              ),
                              Text("Share"),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "AddContact",
                                  arguments: {
                                    'contactList': value.contactList,
                                    'contactIndex': index,
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: CupertinoColors.link,
                              ),
                            ),
                            Text("Edit"),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            Provider.of<ContactProvider>(context, listen: false)
                                .deleteContact(index);
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text("Delete"),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.white,
        child: Icon(CupertinoIcons.person_badge_plus_fill),
        onPressed: () {
          if (widget.index != null) {}
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
