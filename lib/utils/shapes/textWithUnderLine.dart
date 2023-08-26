import 'package:flutter/material.dart';

import '../constants/colors.dart';

class textWithUnderLine extends StatelessWidget {
  textWithUnderLine({Key? key,required this.txt,required this.wdt}) : super(key: key);
  var txt,wdt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          txt,
          style: TextStyle(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 2,
          color: yellowColor,
          width: wdt,
        )
      ],
    );
  }
}
