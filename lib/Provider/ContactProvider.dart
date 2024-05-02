import 'package:contact_diary/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  void addContact(String name, String email, String mobileNo) {
    contactList.add(
      ContactModel(
          Contact_name: name, Contact_email: email, Contact_mobileNo: mobileNo),
    );
    notifyListeners();
  }
}
