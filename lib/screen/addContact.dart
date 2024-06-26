import 'package:contact_diary/Provider/ContactProvider.dart';
import 'package:contact_diary/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget {
  int? index;

  final ContactModel? contactModel;

  AddContact({Key? key, this.index, this.contactModel}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  TextEditingController contactMobileNoController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController officeNameController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController personalNotesController = TextEditingController();
  TextEditingController officialNotesController = TextEditingController();

  int currentStep = 0;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.contactModel != null) {
      var contact = widget.contactModel!;

      contactNameController.text = contact.Contact_name ?? "Not available";
      contactEmailController.text = contact.Contact_email ?? "Not available";
      contactMobileNoController.text =
          contact.Contact_mobileNo ?? "Not available";
      birthDateController.text = contact.birthdate ?? "Not available";
      addressController.text = contact.Contact_address ?? "Not available";
      officeNameController.text = contact.Office_name ?? "Not available";
      officeAddressController.text = contact.Office_Address ?? "Not available";
      websiteController.text = contact.Office_website ?? "Not available";
      personalNotesController.text = contact.PersonalNote ?? "Not available";
      officialNotesController.text = contact.OfficialNote ?? "Not available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.white,
        title:
            Text(widget.contactModel != null ? "Edit Contact" : "Add Contact"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 411,
              color: CupertinoColors.link.withOpacity(0.1),
              child: Consumer<ContactProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Center(child: Text("Comming Soon!!"));
                },
              ),
            ),
            Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () async {
                if (currentStep == 0) {
                  String name = contactNameController.text;
                  String email = contactEmailController.text;
                  String mobileNo = contactMobileNoController.text;

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("ContactName", name);
                  sp.setString("ContactEmail", email);
                  sp.setString("ContactMobileNo", mobileNo);

                  Provider.of<ContactProvider>(context, listen: false)
                      .setContactDetails(name, email, mobileNo);
                } else if (currentStep == 1) {
                  String birthDate = birthDateController.text;
                  String address = addressController.text;

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("ContactBirthdate", birthDate);
                  sp.setString("ContactAddress", address);

                  Provider.of<ContactProvider>(context, listen: false)
                      .setPersonalDetails(birthDate, address);
                } else if (currentStep == 2) {
                  String officeName = officeNameController.text;
                  String officeAddress = officeAddressController.text;
                  String website = websiteController.text;

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("OfficeName", officeName);
                  sp.setString("OfficeAddress", officeAddress);
                  sp.setString("OfficeWebsite", website);

                  Provider.of<ContactProvider>(context, listen: false)
                      .setOfficialDetails(officeName, officeAddress, website);
                } else if (currentStep == 3) {
                  String personalNotes = personalNotesController.text;
                  String officialNotes = officialNotesController.text;

                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("PersonalNotes", personalNotes);
                  sp.setString("OfficialNotes", officialNotes);

                  print("widget.contactModel != null ====>>>>${widget.contactModel != null}");
                  if (widget.contactModel != null) {
                    Provider.of<ContactProvider>(context, listen: false)
                        .editContact(
                      widget.index??0,
                      contactNameController.text,
                      contactEmailController.text,
                      contactMobileNoController.text,
                      birthDateController.text,
                      addressController.text,
                      officeNameController.text,
                      officeAddressController.text,
                      websiteController.text,
                      personalNotesController.text,
                      officialNotesController.text,
                    );
                    Navigator.pop(context);
                  } else {
                    Provider.of<ContactProvider>(context, listen: false)
                        .setNotes(personalNotes, officialNotes);
                    Navigator.pop(context);
                  }
                  // Navigator.pop(context);
                }

                if (currentStep < 3) {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep -= 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        // Contact Details
        Step(
          // state: StepState.complete,
          isActive: currentStep >= 0,
          title: Text("Contact Details"),
          content: Container(
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: contactNameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                // Email
                TextFormField(
                  controller: contactEmailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: "Email Id",
                    counterText: '',
                  ),
                ),
                // MobileNO
                TextFormField(
                  controller: contactMobileNoController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: "Mobile No",
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Personal Details
        Step(
          isActive: currentStep >= 1,
          title: Text("Personal Details"),
          content: Container(
            child: Column(
              children: [
                // BirthDate
                TextFormField(
                  controller: birthDateController,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  maxLength: 8,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: InputDecoration(
                    labelText: "BirthDate",
                    counterText: '',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                // Address
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Address (Optional)",
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Official Details
        Step(
          isActive: currentStep >= 2,
          title: Text("Official Details"),
          content: Container(
            child: Column(
              children: [
                // Office Name
                TextFormField(
                  controller: officeNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: "Office Name",
                    counterText: '',
                  ),
                ),
                // Address
                TextFormField(
                  controller: officeAddressController,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Address (Optional)",
                    counterText: '',
                  ),
                ),
                // Website
                TextFormField(
                  controller: websiteController,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  maxLength: 25,
                  decoration: InputDecoration(
                    labelText: "Website",
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Notes
        Step(
          isActive: currentStep >= 3,
          title: Text("Notes"),
          subtitle: Text("(Optional)"),
          content: Container(
            child: Column(
              children: [
                // Personal Notes
                TextFormField(
                  controller: personalNotesController,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Personal Notes",
                    counterText: '',
                  ),
                ),
                // Official Notes
                TextFormField(
                  controller: officialNotesController,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Official Notes",
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        birthDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    officeNameController.dispose();
    officeAddressController.dispose();
    websiteController.dispose();
    personalNotesController.dispose();
    officialNotesController.dispose();
    super.dispose();
  }
}
