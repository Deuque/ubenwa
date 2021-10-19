import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/pages/homepage/widget/online_indicator.dart';
import 'package:ubenwa_test/util/index.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnlineIndicator(),
              SizedBox(
                height: 8,
              ),
              Text(
                'Junior Sol',
                style: TextStyle(
                    color: dark, fontSize: 22, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'ID -2556 6789',
                style: TextStyle(
                    color: darkGrey, fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,width: 2),
            ),
            child: SvgPicture.asset(
              'avatar'.svg,
              color: darkGrey,
              height: 35,
            ),
          )
        ],
      ),
    );
  }
}
