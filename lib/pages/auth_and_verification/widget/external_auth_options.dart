import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/util/index.dart';

class ExternalAuth extends StatelessWidget {
  const ExternalAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> externalAuth = [
      'Facebook'.svg,
      'twitter'.svg,
      'linkedIn'.svg,
      'google'.svg,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: externalAuth
          .map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  e,
                  height: 25,
                  width: 25,
                ),
              ))
          .toList(),
    );
  }
}
