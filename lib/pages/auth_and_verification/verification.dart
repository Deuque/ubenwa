import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/gradient_scaffold.dart';
import 'package:ubenwa_test/components/logo.dart';
import 'package:ubenwa_test/controllers/verify_controller.dart';
import 'package:ubenwa_test/locator.dart';
import 'package:ubenwa_test/pages/auth_and_verification/form/verify_number_form.dart';
import 'package:ubenwa_test/pages/auth_and_verification/form/verify_otp_form.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/user_layout_switcher.dart';
import 'package:ubenwa_test/util/index.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verifyController = locator<VerifyController>();
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
              animation: verifyController,
              builder: (context, snapshot) {
                return Expanded(
                    child: verifyController.verifyType == VerifyType.verifyNumber
                        ? LayoutSwitcher(
                            child: verifyController.userType == UserType.clinical
                                ? VerifyNumberForm.clinical(
                                    key: ValueKey('1'),
                                  )
                                : VerifyNumberForm.regular(
                                    key: ValueKey('2'),
                                  ),
                          )
                        : LayoutSwitcher(
                            child: verifyController.userType == UserType.clinical
                                ? VerifyOtpForm.clinical(
                                    key: ValueKey('1'),
                                  )
                                : VerifyOtpForm.regular(
                                    key: ValueKey('2'),
                                  ),
                          ));
              }),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
