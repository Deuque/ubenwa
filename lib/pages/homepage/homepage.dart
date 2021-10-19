import 'package:flutter/material.dart';
import 'package:ubenwa_test/components/custom_scaffold.dart';
import 'package:ubenwa_test/components/logo.dart';
import 'package:ubenwa_test/pages/homepage/widget/allow_recording.dart';
import 'package:ubenwa_test/pages/homepage/widget/bottom_nav.dart';
import 'package:ubenwa_test/pages/homepage/widget/header.dart';
import 'package:ubenwa_test/pages/homepage/widget/record_button.dart';
import 'package:ubenwa_test/util/index.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurDialogLayout(builder: (context, dialogController) {
      return GradientScaffold(
          bottomNavigation: BottomNav(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Logo(
                size: 45,
                withLabel: false,
                color: dark,
              ),
              SizedBox(
                height: 15,
              ),
              Header(),
              Spacer(
                flex: 3,
              ),
              RecordButton(
                onTap: () => dialogController.show(AllowRecording(
                  onNoClicked: dialogController.removeDialog,
                )),
              ),
              Spacer(
                flex: 10,
              )
            ],
          ));
    });
  }
}
