import 'dart:core';

class ContactModel {
//   contact Details
  String? Contact_name;
  String? Contact_email;
  String? Contact_mobileNo;

//   personal Details
  String? birthdate;
  String? Contact_address;

//   official Details
  String? Office_name;
  String? Office_Address;
  String? Office_website;

//   Notes
  String? PersonalNote;
  String? OfficialNote;

  ContactModel({
    this.Contact_name,
    this.Contact_email,
    this.Contact_mobileNo,
    this.birthdate,
    this.Contact_address,
    this.Office_name,
    this.Office_Address,
    this.Office_website,
    this.PersonalNote,
    this.OfficialNote,
  });
}
