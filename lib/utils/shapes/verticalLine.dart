import 'package:flutter/material.dart';

import '../constants/colors.dart';

class verticalLine extends StatelessWidget {
  const verticalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: mateBlackColor,
      width: 1.5,
    );
  }
}
