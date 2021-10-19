import 'package:flutter/cupertino.dart';

class VerifyController extends ChangeNotifier{

 UserType _userType = UserType.clinical;
 UserType get userType => _userType;
 VerifyType _verifyType = VerifyType.verifyNumber;
 VerifyType get verifyType => _verifyType;

 void setVerifyType(VerifyType authType){
  _verifyType = authType;
  notifyListeners();
 }

 void setUserType(UserType userType){
  _userType = userType;
  notifyListeners();
 }


}

enum UserType{
 clinical,regular
}

enum VerifyType{
 verifyNumber,verifyOtp
}