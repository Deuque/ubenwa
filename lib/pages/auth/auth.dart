import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/gradient_scaffold.dart';
import 'package:ubenwa_test/components/logo.dart';
import 'package:ubenwa_test/pages/auth/form/signup_form.dart';
import 'package:ubenwa_test/pages/auth/widget/external_auth_options.dart';
import 'package:ubenwa_test/util/index.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Logo(size: ScreenSize.width * .2),
          SizedBox(height: 50,),
          Expanded(child: SignupForm.clinical()),
          SizedBox(height: 20,),
          Text(
            'Or signup with',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
          SizedBox(height: 20,),
          ExternalAuth()
        ],
      ),
    ));
  }


}
