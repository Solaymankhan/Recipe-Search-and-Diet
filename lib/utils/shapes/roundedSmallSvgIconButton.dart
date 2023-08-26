import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class roundedSmallSvgIconButton extends StatelessWidget {
  roundedSmallSvgIconButton({Key? key,required this.icon,required this.icon_clr,required this.btn_clr,required this.onTap}) : super(key: key);

  var icon,onTap,btn_clr,icon_clr;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: btn_clr,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Ink(
          child: SvgPicture.asset(icon,height: 15,width: 10,).box.padding(EdgeInsets.all(8)).make(),
        ),
      ),
    ).box.height(40).width(40).make();
  }
}