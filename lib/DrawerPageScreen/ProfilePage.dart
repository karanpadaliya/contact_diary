import 'package:contact_diary/Provider/SignUpProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController NameController = TextEditingController();
  TextEditingController MobileNoController = TextEditingController();
  TextEditingController PinController = TextEditingController();

  bool isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: Colors.white,
        title: Text('Profile Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!!',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Consumer<SignUpProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  '${value.userName ?? "NoName"}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xfff4f4f4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Username
                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Consumer<SignUpProvider>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${value.userName ?? "NoName"}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Edit Username"),
                                    content: TextField(
                                      controller: NameController,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String editedName =
                                              NameController.text;
                                          Provider.of<SignUpProvider>(context,
                                                  listen: false)
                                              .setUserName(editedName);
                                          Navigator.pop(context,
                                              editedName); // Pass the edited value back to the caller
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: CupertinoColors.link,
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.edit),
                          //   color: CupertinoColors.link,
                          // ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //MobileNo
                      Text(
                        "Mobile No",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Consumer<SignUpProvider>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${value.userMobileNo ?? "NoMobileNo"}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Edit MobileNo"),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      controller: MobileNoController,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String editedMobileNo =
                                              MobileNoController.text;
                                          Provider.of<SignUpProvider>(context,
                                                  listen: false)
                                              .setMobileNo(editedMobileNo);
                                          Navigator.pop(context,
                                              editedMobileNo); // Pass the edited value back to the caller
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: CupertinoColors.link,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Pin
                      Text(
                        "Pin",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Consumer<SignUpProvider>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    isPinVisible
                                        ? '${value.userPin ?? "No Pin"}'
                                        : '****',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                    () {
                                  isPinVisible = !isPinVisible;
                                  if (!isPinVisible) {
                                    PinController.text = '';
                                  }
                                },
                              );
                            },
                            icon: isPinVisible
                                ? Icon(Icons.visibility_off,size: 20,)
                                : Icon(Icons.visibility,size: 25,),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Edit Pin"),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      controller: PinController,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String editedPin = PinController.text;
                                          Provider.of<SignUpProvider>(context,
                                                  listen: false)
                                              .setPin(editedPin);
                                          Navigator.pop(context,
                                              PinController); // Pass the edited value back to the caller
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: CupertinoColors.link,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
