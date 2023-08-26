import "package:flutter/material.dart";

import "../constants/colors.dart";


class fadedText extends StatelessWidget {
  fadedText({Key? key,required this.txt}) : super(key: key);
  String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style:TextStyle(
        color: darkGreyColor,
        fontSize: 12,
        fontWeight: FontWeight.w500),
    );
  }
}
