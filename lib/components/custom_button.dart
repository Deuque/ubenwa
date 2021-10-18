import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/theme.dart';

class MButton extends StatelessWidget {
  final bool isEnabled;
  final String title;
  final VoidCallback? onTap;
  final bool fullSized;

  const MButton(
      {Key? key,
      required this.isEnabled,
      required this.title,
      this.onTap,
      this.fullSized = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: StadiumBorder(),
      child: Container(
        decoration: BoxDecoration(
            border: isEnabled ? null : Border.all(color: disabled, width: 1),
            borderRadius: BorderRadius.circular(100),
            gradient: isEnabled ? buttonGradient : null),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        alignment: fullSized ? Alignment.center : null,
        child: Text(
          title,
          style: TextStyle(
              color: isEnabled ? Colors.white : disabled,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
