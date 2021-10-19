import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/extensions.dart';
import 'package:ubenwa_test/util/theme.dart';

class Logo extends StatelessWidget {
  final double size;
  final bool withLabel;
  final Color? color;

  const Logo({Key? key, required this.size, this.withLabel = true,
  this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'logo'.png,
          height: size,
          width: size,
          color: color,
        ),
        if (withLabel)
          Text(
            'Ubenwa',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: size / 5, color: dark),
          ),
      ],
    );
  }
}
