import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/index.dart';

class MTextField extends StatelessWidget {
  final String hint;

  const MTextField({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            hint,
            style:
                TextStyle(color: dark, fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        SizedBox(height: 3,),
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
              borderRadius: BorderRadius.circular(100)),
          child: Material(
            shape: StadiumBorder(),
            color: textFieldBg,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15,),
              child: TextField(
                maxLines: 1,
                style: TextStyle(
                    color: dark, fontWeight: FontWeight.w500, fontSize: 13),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
