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
  void initState() {
    _getSignUpDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 411,
                  color: CupertinoColors.link.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!!",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Consumer<SignUpProvider>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return Text(
                              "${value.userName}".toUpperCase(),
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "sedan",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Birthdate Contact
            Container(
              height: 30,
              width: 410,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                children: [
                  Consumer<ContactProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Recent Birthday ${value.contactList.length}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: 200,
                child: _consumerBirthday(),
              ),
            ),

            //Total Contact
            Container(
              height: 30,
              width: 410,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                children: [
                  Consumer<ContactProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Total Contact ${value.contactList.length}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: 300,
                child: _consumer(),
              ),
            ),
          ],
        ),
      ), //All Container and data is pass to the _consumer
      floatingActionButton: _floatingActionButton(),
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

  AppBar _appBar() {
    return AppBar(
      title: Text('Home Page'),
      backgroundColor: CupertinoColors.link,
      foregroundColor: CupertinoColors.systemGroupedBackground,
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.search,
            size: 25,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "SearchPage");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton(
            elevation: 10,
            position: PopupMenuPosition.under,
            // splashRadius: 50,
            surfaceTintColor: CupertinoColors.white,
            color: CupertinoColors.white.withOpacity(0.9),
            // enableFeedback: true,
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
                          // Navigator.pop(context);
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
        ),
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
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
    );
  }

  Consumer _consumer() {
    return Consumer<ContactProvider>(
      builder: (BuildContext context, ContactProvider value, Widget? child) {
        return Container(
          child: ListView.builder(
            itemCount: value.contactList.length,
            itemBuilder: (context, index) {
              ContactModel contact = value.contactList[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'ViewContact',
                    arguments: value.contactList[index],
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${contact.Contact_name}"[0].toUpperCase()),
                  ),
                  title: Text(contact.Contact_name ?? "Contact_Name_Not_Found"),
                  subtitle: Text(
                      contact.Contact_mobileNo ?? "Contact_MobileNo_Not_Found"),
                  trailing: PopupMenuButton(
                    elevation: 10,
                    position: PopupMenuPosition.under,
                    // splashRadius: 50,
                    surfaceTintColor: CupertinoColors.white,
                    color: Colors.white.withOpacity(0.9),
                    // enableFeedback: true,
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
                              Provider.of<ContactProvider>(context,
                                      listen: false)
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
                ),
              );
            },
          ),
        );
      },
    );
  }

  Consumer _consumerBirthday() {
    return Consumer<ContactProvider>(
      builder: (BuildContext context, ContactProvider value, Widget? child) {
        return Container(
          child: ListView.builder(
            itemCount: value.contactList.length,
            itemBuilder: (context, index) {
              ContactModel contact = value.contactList[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'ViewContact',
                    arguments: value.contactList[
                        index], // Pass the data of the tapped list item
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${contact.Contact_name}"[0].toUpperCase()),
                  ),
                  title: Text(contact.Contact_name ?? "Contact_Name_Not_Found"),
                  subtitle: Text(contact.birthdate ?? "Birthdate_Not_Found"),
                  trailing: PopupMenuButton(
                    elevation: 10,
                    position: PopupMenuPosition.under,
                    // splashRadius: 50,
                    surfaceTintColor: CupertinoColors.white,
                    color: Colors.white.withOpacity(0.9),
                    // enableFeedback: true,
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
                              Provider.of<ContactProvider>(context,
                                      listen: false)
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
                ),
              );
            },
          ),
        );
      },
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: CupertinoColors.link,
      foregroundColor: CupertinoColors.white,
      child: Icon(CupertinoIcons.person_badge_plus_fill),
      onPressed: () {
        if (widget.index != null) {}
        Navigator.pushNamed(context, "AddContact");
      },
    );
  }

  void _getSignUpDetails() async {
    var setUser = await SharedPreferences.getInstance();
    var setMobileNo = await SharedPreferences.getInstance();
    var setPin = await SharedPreferences.getInstance();
    var getName = setUser.getString("userName");
    var getMobileNo = setMobileNo.getString("mobileNo");
    var getPin = setPin.getString("pin");

    String userName = getName ?? "Not_Get_UserName";
    String mobileNo = getMobileNo ?? "Not_Get_MobileNo";
    String pin = getPin ?? "Not_Get_Pin";
    Provider.of<SignUpProvider>(context, listen: false)
        .setUserDetails(userName, mobileNo, pin);

    // Name / Email /MobileNo
    var setContactName = await SharedPreferences.getInstance();
    var getContactName = setContactName.getString("ContactName");
    String ContactName = getContactName ?? "getContactName_notFound";

    var setContactEmail = await SharedPreferences.getInstance();
    var getContactEmail = setContactEmail.getString("ContactEmail");
    String ContactEmail = getContactEmail ?? "getContactEmail_notFound";

    var setContactMobileNo = await SharedPreferences.getInstance();
    var getContactMobileNo = setContactMobileNo.getString("ContactMobileNo");
    String ContactMobileNo =
        getContactMobileNo ?? "getContactMobileNo_notFound";
    Provider.of<ContactProvider>(context, listen: false)
        .setContactDetails(ContactName, ContactEmail, ContactMobileNo);

    // Birthdate / Address
    var setContactBirthdate = await SharedPreferences.getInstance();
    var getContactBirthdate = setContactBirthdate.getString("ContactBirthdate");
    String ContactBirthdate =
        getContactBirthdate ?? "ContactBirthdate_notFound";

    var setContactAddress = await SharedPreferences.getInstance();
    var getContactAddress = setContactAddress.getString("ContactAddress");
    String ContactAddress = getContactAddress ?? "ContactAddress_notFound";
    Provider.of<ContactProvider>(context, listen: false)
        .setPersonalDetails(ContactBirthdate, ContactAddress);

    //   OfficeName / OfficeAddress / website
    var setOfficeName = await SharedPreferences.getInstance();
    var getOfficeName = setOfficeName.getString("OfficeName");
    String OfficeName = getOfficeName ?? "OfficeName_notFound";

    var setOfficeAddress = await SharedPreferences.getInstance();
    var getOfficeAddress = setOfficeAddress.getString("OfficeAddress");
    String OfficeAddress = getOfficeAddress ?? "OfficeAddress_notFound";

    var setOfficeWebsite = await SharedPreferences.getInstance();
    var getOfficeWebsite = setOfficeWebsite.getString("OfficeWebsite");
    String OfficeWebsite = getOfficeWebsite ?? "OfficeWebsite_notFound";

    Provider.of<ContactProvider>(context, listen: false)
        .setOfficialDetails(OfficeName, OfficeAddress, OfficeWebsite);

    //   PersonalNote / OfficialNote
    var setPersonalNote = await SharedPreferences.getInstance();
    var getPersonalNote = setPersonalNote.getString("personalNotes");
    String PersonalNote = getPersonalNote ?? "PersonalNote_notFound";

    var setOfficialNote = await SharedPreferences.getInstance();
    var getOfficialNote = setOfficialNote.getString("officialNotes");
    String OfficialNote = getOfficialNote ?? "OfficialNote_notFound";

    Provider.of<ContactProvider>(context, listen: false)
        .setNotes(PersonalNote, OfficialNote);
  }
}
