import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController BirthDateController = TextEditingController();

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
            Container(
              height: 200,
              color: Colors.blueAccent,
            ),
            Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
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
        Step(
          isActive: currentStep >= 0,
          title: Text("Contact Details"),
          content: Container(
            child: Column(
              children: [
                // Name
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text("Name"),
                  ),
                ),
                // Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  decoration: InputDecoration(
                    label: Text("Email Id"),
                    counterText: '',
                  ),
                ),
                // MobileNO
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    label: Text("Mobile No"),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text("Personal Details"),
          content: Container(
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: BirthDateController,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  maxLength: 8,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: InputDecoration(
                    label: Text("BirthDate"),
                    counterText: '',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                // Email
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: Text("Address (Optional)"),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text("Official Details"),
          content: Container(
            child: Column(
              children: [
                // Email
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text("Office Name"),
                    counterText: '',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: Text("Address (Optional)"),
                    counterText: '',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  maxLength: 25,
                  decoration: const InputDecoration(
                    label: Text("Website"),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: Text("Notes"),
          subtitle: Text("(Optional)"),
          content: Container(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: Text("Personal Notes"),
                    counterText: '',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLength: 40,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: Text("Offical Notes"),
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
        BirthDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}
