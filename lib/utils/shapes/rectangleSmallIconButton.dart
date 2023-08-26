import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class rectangleSmallIconButton extends StatelessWidget {
  rectangleSmallIconButton({Key? key,required this.icon,required this.icon_clr,required this.btn_clr,required this.onTap}) : super(key: key);

  var icon,onTap,btn_clr,icon_clr;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: btn_clr,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          child: Icon(icon,color: icon_clr,size: 16,),
        ),
      ),
    ).box.height(25).width(25).make();
  }
}