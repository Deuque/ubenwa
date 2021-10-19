import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/util/index.dart';

class DialogImage extends StatelessWidget {
  final String assetName;

  const DialogImage({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: screenGradient1.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: SvgPicture.asset(
        assetName.svg,
        height: ScreenSize.width * .4,
      ),
    );
  }
}
