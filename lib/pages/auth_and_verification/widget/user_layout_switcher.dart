import 'package:flutter/material.dart';
class LayoutSwitcher extends StatelessWidget {
  final Widget child;
  const LayoutSwitcher({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      switchInCurve: Curves.decelerate,
      switchOutCurve: Curves.decelerate,
      transitionBuilder: (child, animation) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ),
    child: child,);
  }
}
