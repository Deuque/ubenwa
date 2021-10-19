import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_test/pages/auth_and_verification/widget/custom_textfield.dart';

class OtpCodes extends StatefulWidget {
  final Function(String s) onDone;
  final int codeLength;

  const OtpCodes({Key? key, required this.onDone, required this.codeLength})
      : super(key: key);

  @override
  _OtpCodesState createState() => _OtpCodesState();
}

class _OtpCodesState extends State<OtpCodes> {
  List<FocusNode> focusNodes = [];
  List<Widget Function()> textFields = [];
  List<TextEditingController> textFieldControllers = [];
  int currentTextField = 0;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(
        widget.codeLength,
        (index) => FocusNode()
          ..addListener(() {
            if (index != 0) {
              if (focusNodes[index].hasFocus) {
                if (textFieldControllers[index - 1].value.text.isEmpty) {
                  currentTextField = index - 1;
                  FocusScope.of(context)
                      .requestFocus(focusNodes[currentTextField]);
                  setState(() {});
                } else {
                  setState(() {
                    currentTextField = index;
                  });
                }
              }
            }
          }));

    textFieldControllers =
        List.generate(widget.codeLength, (index) => TextEditingController());

    textFields = List.generate(
      widget.codeLength,
      (index) {
        return () {
          bool inFocus = currentTextField == index;
          bool hasText = textFieldControllers[index].value.text.isNotEmpty;
          return MTextField(
            fontSize: 15,
            radius: 6,
            focusNode: focusNodes[index],
            controller: textFieldControllers[index],
            onChanged: (String val) {
              if (val.isEmpty) {
                if (currentTextField > 0) {
                  currentTextField--;
                  print(currentTextField);
                  FocusScope.of(context)
                      .requestFocus(focusNodes[currentTextField]);
                  setState(() {});
                } else {
                  setState(() {
                    currentTextField = 0;
                  });
                }
              } else {
                if (val.length == 1) {
                  if (currentTextField < widget.codeLength - 1) {
                    currentTextField++;
                    FocusScope.of(context)
                        .requestFocus(focusNodes[currentTextField]);
                    setState(() {});
                  } else {
                    widget.onDone(textFieldControllers
                        .map((e) => e.value.text)
                        .toList()
                        .join(''));
                  }
                }
              }
            }
          );
        };
      },
    );

    focusNodes[currentTextField].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).secondaryHeaderColor;
    Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    print(currentTextField);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textFields.map((e) {
        bool inFocus = currentTextField == textFields.indexOf(e);
        bool hasText =
            textFieldControllers[textFields.indexOf(e)].value.text.isNotEmpty;
        return Container(
          width: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: e(),
        );
      }).toList(),
    );
  }
}
