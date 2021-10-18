import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/pages/onboarding/model/onboard_model.dart';
import 'package:ubenwa_test/util/screen_size.dart';
import 'package:ubenwa_test/util/theme.dart';

class OnboardItemLayout extends StatelessWidget {
  final OnboardModel model;

  const OnboardItemLayout({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: TextStyle(
            color: dark,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 11,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: dark,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 81,
        ),
        SvgPicture.asset(
          model.assetName,
          height: ScreenSize.width * .54,
          width: ScreenSize.width * .54,
        )
      ],
    );
  }
}
