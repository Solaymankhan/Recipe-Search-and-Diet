import 'package:flutter/material.dart';


class itemsAssetImageShape extends StatelessWidget {
  itemsAssetImageShape({Key? key,required this.hgt,required this.wdt,required this.is_url
    ,required this.radius,required this.img}) : super(key: key);

  var hgt,wdt,is_url,radius,img;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: hgt,
        width: wdt,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: is_url?img:AssetImage(img),
            )));
  }
}
/*
Widget message_network_image_shape(url,wdt){
  return Container(
      height: 300,
      width: wdt*0.6,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: url,
          )));
}
Widget message_asset_image_shape(wdt){
  return Container(
      height: 300,
      width: wdt*0.6,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(izmir_error_img_icon),
          )));
}*/
