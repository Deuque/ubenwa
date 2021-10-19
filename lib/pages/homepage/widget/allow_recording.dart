import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ubenwa_test/components/custom_button.dart';
import 'package:ubenwa_test/pages/homepage/widget/dialog_image.dart';
import 'package:ubenwa_test/util/index.dart';

class AllowRecording extends StatelessWidget {
  final VoidCallback onNoClicked;
  const AllowRecording({Key? key, required this.onNoClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: lightGrey.withOpacity(.2),
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 2)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogImage(
            assetName: 'onboard1',
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            dialogText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, color: dark),
          ),
          SizedBox(
            height: 25,
          ),
          LayoutBuilder(builder: (context, constraint) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: constraint.maxWidth * .4,
                  child: MButton(
                    isEnabled: false,
                    title: 'No',
                    fullSized: true,
                    onTap: onNoClicked,
                  ),
                ),
                SizedBox(
                  width: constraint.maxWidth * .05,
                ),
                Container(
                  width: constraint.maxWidth * .4,
                  child: MButton(
                    isEnabled: true,
                    title: 'Yes',
                    fullSized: true,
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
