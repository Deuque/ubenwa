import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/auth_clipper.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/user_identifier_layout.dart';
import 'package:ubenwa_test/util/index.dart';

class UserLayout extends StatelessWidget {
  final Widget child;
  final bool forClinicalUser;
  final VoidCallback? onClinicalUserClicked;
  final VoidCallback? onRegularUserClicked;

  const UserLayout(
      {Key? key,
      required this.child,
      required this.forClinicalUser,
      this.onRegularUserClicked,
      this.onClinicalUserClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _backgroundLayout(),
        ),
        if (!forClinicalUser)
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(
                  painter: ClipShadowPainter(
                      clipper: AuthClipper(), shadow: authBackgroundShadow),
                  child: ClipPath(
                      clipper: AuthClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      )))),
        if (forClinicalUser)
          CustomPaint(
              painter: ClipShadowPainter(
                  clipper: AuthClipper(), shadow: authBackgroundShadow),
              child: ClipPath(
                  clipper: AuthClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ))),
        Column(
          children: [
            Expanded(child: child),
            LayoutBuilder(
                builder: (context, constraint) => Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => onClinicalUserClicked?.call(),
                            child: Container(
                              height: 100,
                              child: Center(
                                child: UserIdentifier(
                                  forClinicalUser: true,
                                  isActive: forClinicalUser,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => onRegularUserClicked?.call(),
                            child: Container(
                              height: 100,
                              child: Center(
                                child: UserIdentifier(
                                  forClinicalUser: false,
                                  isActive: !forClinicalUser,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
          ],
        ),
      ],
    );
  }

  Widget _backgroundLayout() => Container(
        decoration: BoxDecoration(
            color: screenGradient1,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: disabled.withOpacity(.5),
                  offset: Offset(0, 4),
                  blurRadius: 1)
            ]),
      );
}
