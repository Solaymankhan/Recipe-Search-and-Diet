import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class labelsText extends StatelessWidget {
  labelsText({Key? key, required this.txt}) : super(key: key);
  String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: blackColor, fontSize: 12, fontWeight: FontWeight.bold),
    )
        .box
        .color(darkGrey2Color)
        .padding(EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1))
        .margin(EdgeInsets.all(2))
        .customRounded(BorderRadius.circular(8))
        .make();
  }
}
