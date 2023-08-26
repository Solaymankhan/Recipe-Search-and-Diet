import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class nutritionShape extends StatelessWidget {
  nutritionShape({Key? key,required this.top_text,required this.bottom_text}) : super(key: key);

  var top_text,bottom_text;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment:
      CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          top_text,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500),
        )
            .box
            .color(darkGrey2Color)
            .shadowSm
            .padding(EdgeInsets.only(
            left: 5,
            right: 5,
            top: 1,
            bottom: 1))
            .customRounded(
            BorderRadius.circular(8))
            .make(),
        5.heightBox,
        Text(
          bottom_text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
