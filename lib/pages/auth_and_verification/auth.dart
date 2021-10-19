import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_scaffold.dart';
import 'package:ubenwa_test/components/logo.dart';
import 'package:ubenwa_test/controllers/auth_controller.dart';
import 'package:ubenwa_test/locator.dart';
import 'package:ubenwa_test/pages/auth_and_verification/form/login_form.dart';
import 'package:ubenwa_test/pages/auth_and_verification/form/signup_form.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/external_auth_options.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/user_layout_switcher.dart';
import 'package:ubenwa_test/util/index.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = locator<AuthController>();
    return GradientScaffold(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Logo(size: ScreenSize.width * .2),
          SizedBox(
            height: 50,
          ),
          AnimatedBuilder(
              animation: authController,
              builder: (context, snapshot) {
                return Expanded(
                    child: authController.authType == AuthType.signup
                        ? LayoutSwitcher(
                            child: authController.userType == UserType.clinical
                                ? SignupForm.clinical(
                                    key: ValueKey('1'),
                                    onRegularUserClicked: () => authController
                                        .setUserType(UserType.regular),
                                  )
                                : SignupForm.regular(
                                    key: ValueKey('2'),
                                    onClinicalUserClicked: () => authController
                                        .setUserType(UserType.clinical),
                                  ),
                          )
                        : LayoutSwitcher(
                            child: authController.userType == UserType.clinical
                                ? LoginForm.clinical(
                                    key: ValueKey('1'),
                                    onRegularUserClicked: () => authController
                                        .setUserType(UserType.regular),
                                  )
                                : LoginForm.regular(
                                    key: ValueKey('2'),
                                    onClinicalUserClicked: () => authController
                                        .setUserType(UserType.clinical),
                                  ),
                          ));
              }),
          SizedBox(
            height: 20,
          ),
          AnimatedBuilder(
              animation: authController,
              builder: (context, child) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        authController.authType == AuthType.signup
                            ? 'Or signup with'
                            : 'Or login with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: darkGrey.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ExternalAuth()
                    ],
                  ))
        ],
      ),
    ));
  }
}
