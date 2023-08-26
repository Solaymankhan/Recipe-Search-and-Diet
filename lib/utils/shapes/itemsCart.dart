import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_search_and_diet/utils/constants/colors.dart';
import 'package:recipe_search_and_diet/utils/constants/strings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/assets.dart';
import 'itemsAssetImageShape.dart';

class itemsCart extends StatelessWidget {
  itemsCart(
      {Key? key,
      required this.img,
      required this.top_title,
      required this.bottom_title,
      required this.cal,
      required this.ingr,
      required this.onTap})
      : super(key: key);

  var hgt = 150.0,
      wdt = 150.0,
      radius = 0.0,
      img,
      top_title,
      bottom_title,
      cal,
      ingr,
      onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CachedNetworkImage(
                imageUrl: img,
                imageBuilder: (context, url) => Container(
                    height: hgt,
                    width: wdt,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: url,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          top_title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: whiteColor,
                              fontSize: 16),
                        )
                            .box
                            .width(double.infinity)
                            .padding(EdgeInsets.only(left: 5, right: 5,bottom: 15))
                            .linearGradient([mateBlackColor, transparantColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter).make(),
                        Text(
                          bottom_title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: whiteColor,
                              fontSize: 16),
                        )
                            .box
                            .width(double.infinity)
                            .padding(EdgeInsets.only(left: 5, right: 5,top: 15))
                            .linearGradient([mateBlackColor, transparantColor],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter).make(),
                      ],
                    )),
                placeholder: (context, url) => itemsAssetImageShape(
                    hgt: hgt,
                    wdt: wdt,
                    is_url: false,
                    radius: radius,
                    img: error_image),
                errorWidget: (context, url, error) => itemsAssetImageShape(
                    hgt: hgt,
                    wdt: wdt,
                    is_url: false,
                    radius: radius,
                    img: error_image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      cal,
                      style: TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      cal_txt,
                      style: TextStyle(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
                Container(height: 15, width: 0.5, color: darkGreyColor),
                Row(
                  children: [
                    Text(
                      ingr,
                      style: TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ingr_txt,
                      style: TextStyle(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                )
              ],
            ).expand()
          ],
        )
            .box
            .margin(EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5))
            .padding(EdgeInsets.all(3))
            .linearGradient([whiteColor, lightGreyColor],
                begin: AlignmentDirectional.topCenter,
                end: Alignment.bottomCenter)
            .border(width: 0.5, color: darkGrey2Color)
            .make(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(),
          ),
        ).box.margin(EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5)).make()
      ],
    );
  }
}
