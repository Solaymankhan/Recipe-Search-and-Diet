import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class tagsText extends StatelessWidget {
  tagsText({Key? key, required this.txt}) : super(key: key);
  String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: mateBlackColor,
        fontSize: 12,
        decoration: TextDecoration.underline,
      ),
    ).box.margin(EdgeInsets.all(2)).make();
  }
}
