import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/theme.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: screenGradient),
      child: SafeArea(child: child),
    ));
  }
}
