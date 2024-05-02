import 'package:contact_diary/Provider/ContactProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  TextEditingController contactMobileNoController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.white,
        title: Text("Add Contact Details"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   color: Colors.blueAccent,
            //   child: Consumer<ContactProvider>(
            //     builder: (BuildContext context, value, Widget? child) {
            //       return Column(
            //         children: [
            //           Text(value.contactList),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                String name = contactNameController.text;
                String email = contactEmailController.text;
                String mobileNo = contactMobileNoController.text;

                Provider.of<ContactProvider>(context, listen: false)
                    .addContact(name, email, mobileNo);
                // final isLastStep = currentStep == getSteps().length - 1;
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
}
