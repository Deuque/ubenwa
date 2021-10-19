import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{

 UserType _userType = UserType.clinical;
 UserType get userType => _userType;
 AuthType _authType = AuthType.signup;
 AuthType get authType => _authType;

 void setAuthType(AuthType authType){
  _authType = authType;
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

enum AuthType{
 login,signup
}