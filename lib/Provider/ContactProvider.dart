import 'package:contact_diary/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  void setContactDetails(String name, String email, String mobileNo) {
    contactList.add(
      ContactModel(
          Contact_name: name, Contact_email: email, Contact_mobileNo: mobileNo),
    );
    notifyListeners();
  }

  void setPersonalDetails(String birthdate, String? address) {
    // contactList.add(
    //   ContactModel(birthdate: birthdate, Contact_address: address),
    // );
    var old = contactList.last;
    old.birthdate=birthdate;
    old.Contact_address=address;

    contactList[contactList.length - 1] = old;
    notifyListeners();
  }

  void setOfficialDetails(
      String? officeName, String? officeAddress, String? website) {
    // contactList.add(
    //   ContactModel(
    //       Office_name: officeName,
    //       Contact_address: officeAddress,
    //       Office_website: website),
    // );
    var old = contactList.last;
    old.Office_name= officeName;
    old.Contact_address= officeAddress;
    old.Office_website= website;

    contactList[contactList.length - 1] = old;
    notifyListeners();
  }

  void setNotes(String? personalNote, String? officialNote) {
    // contactList.add(
    //   ContactModel(PersonalNote: personalNote, OfficialNote: officialNote),
    // );

    var old = contactList.last;
    old.PersonalNote= personalNote;
    old.OfficialNote= officialNote;

    contactList[contactList.length - 1] = old;
    notifyListeners();
  }

  void deleteContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void editContact(
    int index,
    String name,
    String email,
    String mobileNo,
    String birthdate,
    String? address,
    String? officeName,
    String? officeAddress,
    String? website,
    String? personalNote,
    String? officialNote,
  ) {
    contactList[index] = ContactModel(
      Contact_name: name,
      Contact_email: email,
      Contact_mobileNo: mobileNo,
      birthdate: birthdate,
      Contact_address: address,
      Office_name: officeName,
      Office_Address: officeAddress,
      Office_website: website,
      PersonalNote: personalNote,
      OfficialNote: officialNote,
    );
    notifyListeners();
  }
}
