import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/pages/auth/widget/user_layout.dart';
import 'package:ubenwa_test/pages/auth/widget/custom_textfield.dart';
import 'package:ubenwa_test/util/index.dart';

class SignupForm extends StatelessWidget {
  final bool forClinicalUser;

  const SignupForm.clinical({Key? key})
      : this.forClinicalUser = true,
        super(key: key);

  const SignupForm.regular({Key? key})
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
                  'Signup',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: dark),
                ),
                SizedBox(
                  height: 25,
                ),
                MTextField(
                  hint: 'Username',
                ),
                SizedBox(
                  height: 15,
                ),
                MTextField(
                  hint: 'Email',
                ),
                SizedBox(
                  height: 15,
                ),
                MTextField(
                  hint: 'Password',
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    onboardSubtitle1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 11),
                  ),
                ),
                SizedBox(
                  height: 10,
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
