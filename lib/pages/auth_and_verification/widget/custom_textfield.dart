import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/index.dart';

class MTextField extends StatelessWidget {
  final String? hint;
  final Widget? prefix;
  final double? radius;
  final FocusNode? focusNode;
  final bool fillWidth;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final double? fontSize;


  const MTextField({Key? key, this.hint,this.prefix, this.radius,this.focusNode,
  this.fillWidth =true,this.onChanged,this.controller,this.fontSize}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              hint ?? '',
              style: TextStyle(
                  color: dark, fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 3,
          ),
        ],
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: textFieldShadowColor.withOpacity(.4),
                    spreadRadius: 0,
                    offset: Offset(0, 5),
                    blurRadius: 8),
              ],
              borderRadius: BorderRadius.circular(radius ?? 100)),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 100)),
            color: textFieldBg,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: fillWidth ? 15 : 0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  prefix ?? SizedBox.shrink(),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      focusNode: focusNode,
                      maxLines: 1,
                      style: TextStyle(
                          color: dark,
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize??13),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
