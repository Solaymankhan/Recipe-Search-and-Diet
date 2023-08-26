import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class ingredientsShape extends StatelessWidget {
  ingredientsShape({Key? key,required this.ingredient_txt,required this.category_txt,
  required this.index,required this.len}) : super(key: key);
  var ingredient_txt,category_txt,index,len;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ingredient_txt,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: blackColor,
              fontSize: 14,
              height: 1.2,
              fontWeight: FontWeight.bold),
        )
            .centered()
            .box
            .width(double.infinity)
            .color(greenColor)
            .padding(EdgeInsets.only(
            left: 10, right: 10))
            .customRounded(BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)))
            .make()
            .expand(flex: 2),
        Text(category_txt,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: blackColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: darkGreyColor,
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
              ),
            ],
          ),
        )
            .centered()
            .box
            .height(20)
            .width(double.infinity)
            .color(lightGreenColor)
            .padding(EdgeInsets.only(
            left: 10, right: 10))
            .customRounded(BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)))
            .make()
            .expand(flex: 1)
      ],
    )
        .box
        .color(darkGrey2Color)
        .margin(EdgeInsets.only(
        left: index == 0 ? 25 : 5,
        right: index ==len -
                1
            ? 25
            : 5))
        .width(80)
        .customRounded(BorderRadius.circular(20))
        .make();
  }
}
