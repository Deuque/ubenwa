import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_scaffold.dart';
import 'package:ubenwa_test/components/logo.dart';
import 'package:ubenwa_test/util/screen_size.dart';
import 'package:ubenwa_test/util/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    ScreenSize.init(context);
    Future.delayed(Duration(milliseconds: 900),
            () => Navigator.pushNamed(context, 'onboard'));
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Logo(size: ScreenSize.width * .3),
          Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
