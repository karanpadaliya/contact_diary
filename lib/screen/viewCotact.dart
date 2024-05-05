import 'dart:ui';

import 'package:contact_diary/model/contact_model.dart';
import 'package:contact_diary/screen/addContact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the data passed from the previous page
    final ContactModel value =
        ModalRoute.of(context)?.settings.arguments as ContactModel;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: CupertinoColors.link,
        // foregroundColor: CupertinoColors.white,
        title: Text(
          "${value.Contact_name}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: "sedan",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: CupertinoColors.link),
                  ),
                ),
              ),
              onPressed: () {
                //   Pass the data to AddContact page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddContact(contactModel: value),
                  ),
                );
              },
              child: Text(
                "Edit",
                style: TextStyle(color: CupertinoColors.link),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 500,
                color: Colors.blueAccent,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          _getContactInitial(value.Contact_name ?? "NO_Name"),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sedan",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "${value.Contact_name?.toUpperCase()}",
            style: TextStyle(
              fontFamily: "sedan",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("${value.Contact_mobileNo ?? "Contact_mobileNo_NotFound"}"),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(CupertinoColors.link),
                  elevation: MaterialStatePropertyAll(10),
                ),
                onPressed: () {
                  launchUrl(Uri.parse("sms: ${value.Contact_mobileNo}"));
                },
                child: Icon(Icons.message),
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(CupertinoColors.link),
                  elevation: MaterialStatePropertyAll(10),
                ),
                onPressed: () {
                  launchUrl(Uri.parse("tel: ${value.Contact_mobileNo}"));
                },
                child: Icon(Icons.call),
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(CupertinoColors.link),
                  elevation: MaterialStatePropertyAll(10),
                ),
                onPressed: () {
                  String shareContact =
                      "Please use the following contact details:\n" +
                          "Name: ${value.Contact_name}\n" +
                          "Number: ${value.Contact_mobileNo}\n" +
                          "Shared via Contact Diary.";
                  Share.share(shareContact);
                },
                child: Icon(Icons.share),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 420,
            // color: CupertinoColors.white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, left: 5),
                        child: Text(
                          "Personal Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sedan",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildDetailRow(
                        "Contact Name", value.Contact_name ?? "Not available"),
                    _buildDetailRow(
                        "Email ID", value.Contact_email ?? "Not available"),
                    _buildDetailRow(
                        "Mobile No", value.Contact_mobileNo ?? "Not available"),
                    _buildDetailRow(
                        "Birthdate", value.birthdate ?? "Not available"),
                    _buildDetailRow(
                        "Address", value.Contact_address ?? "Not available"),
                    _buildDetailRow(
                        "Personal Note", value.PersonalNote ?? "Not available"),
                    SizedBox(height: 20),
                    Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, left: 5),
                        child: Text(
                          "Official Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "sedan",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildDetailRow(
                        "Office Name", value.Office_name ?? "Not available"),
                    _buildDetailRow("Office Address",
                        value.Office_Address ?? "Not available"),
                    _buildDetailRow(
                        "Website", value.Office_website ?? "Not available"),
                    _buildDetailRow(
                        "Official Note", value.OfficialNote ?? "Not available"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value ?? "Not available",
                style: TextStyle(color: Colors.grey[800], fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getContactInitial(String contactName) {
    String initial = '';
    List<String> words = contactName.split(' ');
    for (String word in words) {
      if (word.isNotEmpty) {
        initial += word[0];
      }
    }
    return initial.toUpperCase();
  }
}
