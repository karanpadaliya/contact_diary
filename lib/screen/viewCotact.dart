import 'dart:ui';

import 'package:contact_diary/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {

  @override
  Widget build(BuildContext context) {
    // Retrieve the data passed from the previous page
    final ContactModel contact = ModalRoute.of(context)?.settings.arguments as ContactModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.white,
        title: Text("${contact.Contact_name?.toUpperCase()}"),
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
                    child: CircleAvatar(
                      child: Text("Karan"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text("${contact.Contact_name?.toUpperCase()}"),
          Text("${contact.Contact_mobileNo??"Contact_mobileNo_NotFound"}"),
          Container(
            height: 510,
            width: 400,
            // color: Colors.red,
          ),
        ],
      ),
    );
  }
}
