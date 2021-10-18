import 'package:flutter/material.dart';
import 'package:ubenwa_test/pages/auth/widget/auth_clipper.dart';
import 'package:ubenwa_test/pages/auth/widget/user_identifier_layout.dart';
import 'package:ubenwa_test/util/index.dart';

class UserLayout extends StatelessWidget {
  final Widget child;
  final bool forClinicalUser;

  const UserLayout(
      {Key? key, required this.child, required this.forClinicalUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: screenGradient1, borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: disabled.withOpacity(.5),
                  offset: Offset(0,4),
                  blurRadius: 1
              )
            ]),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                  builder: (context, constraint) => Row(
                        children: [
                          Container(
                            height: 100,
                            width: constraint.maxWidth / 2,
                            child: Center(
                              child: UserIdentifier(
                                forClinicalUser: true,
                                isActive: forClinicalUser,
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: constraint.maxWidth / 2,
                            child: Center(
                              child: UserIdentifier(
                                forClinicalUser: false,
                                isActive: !forClinicalUser,
                              ),
                            ),
                          ),
                        ],
                      )),
            ),
          ),
        ),
        CustomPaint(
          painter: ClipShadowPainter(
              clipper: AuthClipper.forLogin(), shadow: authBackgroundShadow),
          child: ClipPath(
            clipper: AuthClipper.forLogin(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(child: child),
                  LayoutBuilder(
                      builder: (context, constraint) => Align(
                            alignment: forClinicalUser
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              height: 100,
                              width: constraint.maxWidth / 2,
                              child: Center(
                                child: UserIdentifier(
                                  forClinicalUser: forClinicalUser,
                                ),
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
