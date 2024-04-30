import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String? userName;
  int? userMobileNo;
  int? userPin;

  void setUserDetails(String name,int mobile,int pin) {
    userName = name;
    userMobileNo = mobile;
    userPin = pin;
    notifyListeners(); // Notify listeners of the change
  }


// SignUpProvider({this.userName, this.userMobileNo, this.userPin});
//
// factory SignUpProvider.fromJson(Map<String, dynamic> json) {
//   return SignUpProvider(
//     userName: json['userName'],
//     userMobileNo: json['userMobileNo'],
//     userPin: json['userPin'],
//   );
}
