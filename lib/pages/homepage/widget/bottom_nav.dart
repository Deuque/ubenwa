import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_test/pages/homepage/model/tab_item.dart';
import 'package:ubenwa_test/util/index.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);
  final List<TabItem> tabs = [
    TabItem(label: 'Screenings', assetName: 'screening'.svg),
    TabItem(label: 'Patient', assetName: 'patient'.svg),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenGradient1,
      padding: EdgeInsets.fromLTRB(15,10,15,25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _tabItemLayout(tabs[0])),
          Expanded(child: _centerAddButton()),
          Expanded(child: _tabItemLayout(tabs[1])),
        ],
      ),
    );
  }

  Widget _tabItemLayout(TabItem tabItem) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            tabItem.assetName,
            height: 24,
            color: lightGrey,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            tabItem.label,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: lightGrey),
          ),
          SizedBox(
            height: 3,
          ),
        ],
      );

  Widget _centerAddButton() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19), gradient: orangeGradient,
            boxShadow: [BoxShadow(
              color: lightGrey,
              offset: Offset(0,3),
              blurRadius: 2,spreadRadius: 1
            )
            ]),
            child: Center(
              child: SvgPicture.asset(
                'add'.svg,
                height: 18,
                color: Colors.white,
              ),
            ),
          ),
    ],
  );
}
