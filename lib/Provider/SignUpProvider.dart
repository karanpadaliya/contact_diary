import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String? userName;
  int? userMobileNo;
  String? userPin;

  void setUserDetails(String name, int mobile, String pin) {
    userName = name;
    userMobileNo = mobile;
    userPin = pin;
    notifyListeners(); // Notify listeners of the change
  }

  void setUserName(String name) {
    userName = name;
    notifyListeners(); // Notify listeners of the change
  }

  void setMobileNo(int mobileNo) {
    userMobileNo = mobileNo;
    notifyListeners(); // Notify listeners of the change
  }

  void setPin(String pin) {
    userPin = pin;
    notifyListeners(); // Notify listeners of the change
  }

  // void goLogin (int mobile, String pin){
  //   int isMobileNo = mobile;
  //   String isPin = pin;
  //
  //   if(userMobileNo == isMobileNo || userPin == isPin){
  //       print("Loginnnn");
  //       // Navigator.pushNamed(context as BuildContext, "HomePage");
  //   }
  //   else{
  //     print("Login Failed");
  //   }
  //   return ;
  // }
}
