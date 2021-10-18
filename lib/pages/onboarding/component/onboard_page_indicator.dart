

import 'package:flutter/material.dart';
import 'package:ubenwa_test/util/index.dart';

class OnboardIndicator extends StatelessWidget {
  final int pages;
  final int currentPage;

  const OnboardIndicator(
      {Key? key, required this.pages, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          pages,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
                margin: EdgeInsets.symmetric(horizontal: 3),
                width: currentPage == index ? 25 : 8,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentPage == index ? darkGrey : lightGrey),
              )),
    );
  }
}
