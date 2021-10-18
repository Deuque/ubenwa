import 'package:flutter/cupertino.dart';

class ScreenSize{
  ScreenSize._();

  static late double width;
  static late double height;
  static void init(BuildContext context){
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}