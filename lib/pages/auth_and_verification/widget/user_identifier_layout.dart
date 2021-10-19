import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/util/index.dart';

class UserIdentifier extends StatelessWidget {
  final bool forClinicalUser;
  final bool isActive;

  const UserIdentifier(
      {Key? key, required this.forClinicalUser, this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          forClinicalUser ? 'clinical'.svg : 'regular'.svg,
          height: 25,
          color: isActive ? dark : darkGrey.withOpacity(.8),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          forClinicalUser ? 'Clinical User' : 'Regular User',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: isActive ? dark : darkGrey.withOpacity(.8)),
        )
      ],
    );
  }
}
