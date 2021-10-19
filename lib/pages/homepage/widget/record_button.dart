import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/index.dart';

class RecordButton extends StatelessWidget {
  final VoidCallback? onTap;
  const RecordButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        'record'.png,
      ),
    );
  }
}
