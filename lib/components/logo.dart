import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/extensions.dart';
import 'package:ubenwa_test/util/theme.dart';
class Logo extends StatelessWidget {
  final double size;
  const Logo({Key? key,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('logo'.png,height: size,width: size,),
        Text(
          'Ubenwa',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: size/5, color: dark),
        ),
      ],
    );
  }
}
