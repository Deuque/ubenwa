import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/pages/auth/widget/user_layout.dart';
import 'package:ubenwa_test/pages/auth/widget/custom_textfield.dart';
import 'package:ubenwa_test/util/index.dart';

class VerifyNumberForm extends StatelessWidget {
  final bool forClinicalUser;

  const VerifyNumberForm.clinical({Key? key})
      : this.forClinicalUser = true,
        super(key: key);

  const VerifyNumberForm.regular({Key? key})
      : this.forClinicalUser = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserLayout(
      forClinicalUser: forClinicalUser,
      child: _formLayout(),
    );
  }

  Widget _formLayout() => LayoutBuilder(builder: (context, constraint) {
        return Container(
          margin: EdgeInsets.fromLTRB(25,25,25,15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: dark),
                ),
                SizedBox(
                  height: 30,
                ),
                MTextField(
                  hint: 'Enter your phone number',
                ),
                SizedBox(
                  height: 15,
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
