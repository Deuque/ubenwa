import 'package:flutter/material.dart';
import 'package:ubenwa_test/locator.dart';
import 'package:ubenwa_test/pages/auth_and_verification/auth.dart';
import 'package:ubenwa_test/pages/auth_and_verification/verification.dart';
import 'package:ubenwa_test/pages/onboarding/onboard.dart';
import 'package:ubenwa_test/pages/splashscreen.dart';
import 'package:ubenwa_test/util/strings.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          fontFamily: plusRoundedFont
      ),
      routes: {
        '/': (context)=>SplashScreen(),
        'onboard': (context)=>Onboard(),
        'auth': (context)=>Auth(),
        'verify': (context)=>Verification()
      },
    );
  }
}
