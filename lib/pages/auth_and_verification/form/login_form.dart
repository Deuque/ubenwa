import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/controllers/verify_controller.dart';
import 'package:ubenwa_test/locator.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/custom_textfield.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/user_layout.dart';

import 'package:ubenwa_test/util/index.dart';

class LoginForm extends StatelessWidget {
  final bool forClinicalUser;
  final VoidCallback? onClinicalUserClicked;
  final VoidCallback? onRegularUserClicked;

  const LoginForm.clinical({Key? key, this.onRegularUserClicked})
      : this.forClinicalUser = true,
        this.onClinicalUserClicked = null,
        super(key: key);

  const LoginForm.regular({Key? key, this.onClinicalUserClicked})
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
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 22, color: dark),
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
                  hint: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 11),
                  ),
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
                    onTap: (){
                      locator<VerifyController>().setUserType(forClinicalUser
                          ? UserType.clinical
                          : UserType.regular);
                      Navigator.pushNamed(context, 'verify');
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
