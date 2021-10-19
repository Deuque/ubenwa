import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/otp_code_layout.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/user_layout.dart';
import 'package:ubenwa_test/util/index.dart';

class VerifyOtpForm extends StatelessWidget {
  final bool forClinicalUser;
  final VoidCallback? onClinicalUserClicked;
  final VoidCallback? onRegularUserClicked;

  const VerifyOtpForm.clinical({Key? key, this.onRegularUserClicked})
      : this.forClinicalUser = true,
        this.onClinicalUserClicked = null,
        super(key: key);

  const VerifyOtpForm.regular({Key? key, this.onClinicalUserClicked})
      : this.forClinicalUser = false,
        this.onRegularUserClicked = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserLayout(
      forClinicalUser: forClinicalUser,
      onClinicalUserClicked: onClinicalUserClicked,
      onRegularUserClicked: onRegularUserClicked,
      child: _formLayout(),
    );
  }

  Widget _formLayout() => LayoutBuilder(builder: (context, constraint) {
        return Container(
          margin: EdgeInsets.fromLTRB(25, 25, 25, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 22, color: dark),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Enter the 4 digit code sent via SMS to this number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: dark, fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                OtpCodes(onDone: (s) {}, codeLength: 4),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: constraint.maxWidth * .6,
                  child: MButton(
                    isEnabled: true,
                    title: 'Continue',
                    fullSized: true,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
