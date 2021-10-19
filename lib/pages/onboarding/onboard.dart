import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/components/custom_scaffold.dart';
import 'package:ubenwa_test/controllers/auth_controller.dart';
import 'package:ubenwa_test/pages/onboarding/component/onboard_layout.dart';
import 'package:ubenwa_test/pages/onboarding/component/onboard_page_indicator.dart';
import 'package:ubenwa_test/pages/onboarding/model/onboard_model.dart';
import 'package:ubenwa_test/util/index.dart';

import '../../locator.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _onboardPage = ValueNotifier(0);
    final _onboardings = [
      OnboardModel(
          title: onboardTitle1,
          subtitle: onboardSubtitle1,
          assetName: 'onboard1'.svg),
      OnboardModel(
          title: onboardTitle2,
          subtitle: onboardSubtitle1,
          assetName: 'onboard2'.svg),
      OnboardModel(
          title: onboardTitle3,
          subtitle: onboardSubtitle1,
          assetName: 'onboard3'.svg),
      OnboardModel(
          title: onboardTitle4,
          subtitle: onboardSubtitle1,
          assetName: 'onboard4'.svg),
      OnboardModel(
          title: onboardTitle5,
          subtitle: onboardSubtitle1,
          assetName: 'onboard5'.svg),
    ];
    final PageController _controller = PageController();
    final int lastPage = _onboardings.length - 1;

    return GradientScaffold(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: MButton(
              title: 'Skip',
              isEnabled: false,
              onTap: () {
                _controller.animateToPage(lastPage,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
            ),
          ),
          SizedBox(
            height: 37,
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children:
                  _onboardings.map((e) => OnboardItemLayout(model: e)).toList(),
              onPageChanged: (newPage) {
                _onboardPage.value = newPage;
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MButton(
                isEnabled: false,
                title: 'Login',
                onTap: () {
                  locator<AuthController>().setAuthType(AuthType.login);
                  Navigator.pushNamed(context, 'auth');
                },
              ),
              Spacer(),
              ValueListenableBuilder<int>(
                  valueListenable: _onboardPage,
                  builder: (context, int value, child) => OnboardIndicator(
                      pages: _onboardings.length, currentPage: value)),
              Spacer(),
              ValueListenableBuilder<int>(
                  valueListenable: _onboardPage,
                  builder: (context, int value, child) {
                    bool enabled = value == lastPage;
                    return MButton(
                        isEnabled: enabled,
                        onTap: () {
                          locator<AuthController>()
                              .setAuthType(AuthType.signup);
                          Navigator.pushNamed(context, 'auth');
                        },
                        title: 'SignUp');
                  }),
            ],
          )
        ],
      ),
    ));
  }
}
