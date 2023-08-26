import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';


class topText extends StatelessWidget {
  const topText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children:[
          TextSpan(
            text:  refine_txt,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text:cal_diet_ingr_txt,
            style: TextStyle(
                color: mateBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          WidgetSpan(
            child: Icon(Icons.keyboard_arrow_down_outlined,color: mateBlackColor,size: 16,),
          ),
        ],
      ),
    );
  }
}
