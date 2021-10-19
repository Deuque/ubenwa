import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/index.dart';

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 20,
          decoration: BoxDecoration(
              gradient: greenGradient,
              borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'online',
          style: TextStyle(
              color: darkGrey, fontSize: 13, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
