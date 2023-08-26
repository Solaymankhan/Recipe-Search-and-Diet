import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_search_and_diet/utils/shapes/fadedText.dart';
import 'package:recipe_search_and_diet/utils/shapes/ingredientsShape.dart';
import 'package:recipe_search_and_diet/utils/shapes/labelsText.dart';
import 'package:recipe_search_and_diet/utils/shapes/nutritionShape.dart';
import 'package:recipe_search_and_diet/utils/shapes/rectangleSmallIconButton.dart';
import 'package:recipe_search_and_diet/utils/shapes/tagsText.dart';
import 'package:recipe_search_and_diet/utils/shapes/textWithUnderLine.dart';
import 'package:recipe_search_and_diet/utils/shapes/topText.dart';
import 'package:recipe_search_and_diet/utils/shapes/verticalLine.dart';
import 'package:recipe_search_and_diet/viewAndViewModel/webView/webViewPage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/itemsModel.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/strings.dart';
import '../../utils/shapes/itemsAssetImageShape.dart';
import '../../utils/shapes/roundedSmallIconButton.dart';
import '../../utils/shapes/roundedSmallSvgIconButton.dart';
import 'blocs/item_details_bloc.dart';

class itemDetailsPage extends StatelessWidget {
  itemDetailsPage({Key? key, required this.data}) : super(key: key);
  Hits data;
  var hgt = 150.0, wdt = 150.0, radius = 15.0;
  int indx = 0;
  ItemDetailsBloc itemDetailsBloc = new ItemDetailsBloc();

  @override
  Widget build(BuildContext context) {
    itemDetailsBloc.add(DetailsNutritionSelectEvent(indx));
    return BlocConsumer<ItemDetailsBloc, ItemDetailsState>(
      bloc: itemDetailsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                roundedSmallSvgIconButton(
                    icon: bar_svg,
                    icon_clr: whiteColor,
                    btn_clr: greenColor,
                    onTap: () {}),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: darkGreyColor,
                          blurRadius: 2.0,
                          offset: Offset(-1.0, 2.0),
                          spreadRadius: 0.01),
                    ],
                  ),
                  onChanged: (val) {
                    /* EasyDebounce.debounce(
                        'search_debounce',
                        Duration(milliseconds: 500),
                            () => searchItemsBloc.add(SearchTextEvent(val.length > 0
                            ? val
                            : "all"))
                    );*/
                  },
                ))
              ],
            ),
            actions: [
              roundedSmallIconButton(
                  icon: CupertinoIcons.text_alignleft,
                  icon_clr: mateBlackColor,
                  btn_clr: Colors.transparent,
                  onTap: () {}),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Stack(
            children: [
              SvgPicture.asset(
                green_circle_svg,
                width: 160,
              ).objectTopRight(),
              SafeArea(
                child: Column(children: [
                  topText().centered(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.recipe!.label!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1),
                                  ),
                                  10.heightBox,
                                  Text(
                                    see_full_recipe_txt,
                                    style: TextStyle(
                                        color: blackColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        height: 0.8),
                                  ),
                                  Text(
                                    "${data.recipe!.source!}",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ).onTap(() {
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (context) => webViewPage(
                                                url: data.recipe!.url)));
                                  }),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      rectangleSmallIconButton(
                                              icon:
                                                  CupertinoIcons.plus_app_fill,
                                              icon_clr: blackColor,
                                              btn_clr: greenColor,
                                              onTap: () {})
                                          .box
                                          .margin(EdgeInsets.only(right: 10))
                                          .make(),
                                      rectangleSmallIconButton(
                                          icon: CupertinoIcons
                                              .arrowshape_turn_up_right_fill,
                                          icon_clr: blackColor,
                                          btn_clr: greenColor,
                                          onTap: () {})
                                    ],
                                  )
                                ],
                              )
                                  .box
                                  .margin(EdgeInsets.only(right: 10))
                                  .make()
                                  .expand(),
                              CachedNetworkImage(
                                  imageUrl: data.recipe!.image!,
                                  imageBuilder: (context, url) => Container(
                                      height: hgt,
                                      width: wdt,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(radius),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: url,
                                          ))),
                                  placeholder: (context, url) =>
                                      itemsAssetImageShape(
                                          hgt: hgt,
                                          wdt: wdt,
                                          is_url: false,
                                          radius: radius,
                                          img: error_image),
                                  errorWidget: (context, url, error) =>
                                      itemsAssetImageShape(
                                          hgt: hgt,
                                          wdt: wdt,
                                          is_url: false,
                                          radius: radius,
                                          img: error_image)),
                            ],
                          )
                              .box
                              .margin(
                                  EdgeInsets.only(left: 25, right: 25, top: 15))
                              .make(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              fadedText(txt: health_labels_txt),
                              Wrap(
                                children: data.recipe!.healthLabels!
                                    .map((e) => labelsText(txt: e))
                                    .toList(),
                              ),
                              5.heightBox,
                              fadedText(txt: cuisine_type_txt),
                              Wrap(
                                children: data.recipe!.cuisineType!
                                    .map((e) => labelsText(txt: e))
                                    .toList(),
                              ),
                              5.heightBox,
                              textWithUnderLine(txt: ingredients_txt, wdt: 95.0)
                            ],
                          )
                              .box
                              .margin(EdgeInsets.only(left: 25, right: 25))
                              .make(),
                          10.heightBox,
                          ListView.builder(
                              itemCount: data.recipe!.ingredients!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return
                                  ingredientsShape(
                                      ingredient_txt:data.recipe!.ingredients![index].text!,
                                      category_txt: data.recipe!.ingredients![index].foodCategory!,
                                      index: index,
                                      len:data.recipe!.ingredients!.length);
                              }).box.height(80).make(),
                          15.heightBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWithUnderLine(
                                  txt: preparation_txt, wdt: 100.0),
                              25.heightBox,
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: instruction_txt,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "${data.recipe!.source}",
                                      style: TextStyle(
                                          color: mateBlackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: mateBlackColor,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ).centered(),
                              10.heightBox,
                              textWithUnderLine(txt: nutrition_txt, wdt: 75.0),
                              5.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  nutritionShape(
                                      top_text: data.recipe!.calories!
                                          .round()
                                          .toString(),
                                      bottom_text: cal_serv_txt),
                                  verticalLine(),
                                  nutritionShape(
                                      top_text:
                                          "${data.recipe!.yield!.round()}%",
                                      bottom_text: daily_value_txt),
                                  verticalLine(),
                                  nutritionShape(
                                      top_text: data.recipe!.totalTime!
                                          .round()
                                          .toString(),
                                      bottom_text: servings_txt),
                                ],
                              )
                                  .box
                                  .color(greenColor)
                                  .height(70)
                                  .padding(EdgeInsets.all(10))
                                  .customRounded(BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)))
                                  .make(),
                              10.heightBox,
                              textWithUnderLine(txt: tags_txt, wdt: 42.0),
                              5.heightBox,
                              Wrap(
                                children: data.recipe!.digest!
                                    .map((e) => tagsText(
                                        txt:
                                            "${e.tag!.replaceAll(" ", '-')}, "))
                                    .toList(),
                              ),
                              10.heightBox,
                              textWithUnderLine(txt: nutrition_txt, wdt: 75.0),
                              10.heightBox,
                              if (state is DetailsNutritionSelectState)
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: data.recipe!.digest!.length,
                                            itemBuilder: (context, index) {
                                              return Chip(
                                                label: Text(data.recipe!
                                                        .digest![index].label!)
                                                    .box
                                                    .color(transparantColor)
                                                    .make(),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 13.0,
                                                    vertical: 1),
                                                side: BorderSide.none,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                backgroundColor:
                                                    state.index == index
                                                        ? greenColor
                                                        : whiteColor,
                                              )
                                                  .box
                                                  .margin(
                                                      EdgeInsets.only(right: 5))
                                                  .withShadow([
                                                    state.index == index
                                                        ? BoxShadow(
                                                            color:
                                                                darkGrey2Color,
                                                            blurRadius: 10,
                                                            offset:
                                                                Offset(0, 15),
                                                            spreadRadius: 0.01)
                                                        : BoxShadow(
                                                            color:
                                                                transparantColor)
                                                  ])
                                                  .make()
                                                  .onTap(() {
                                                    itemDetailsBloc.add(
                                                        DetailsNutritionSelectEvent(
                                                            index));
                                                  });
                                            })
                                        .box
                                        .height(45)
                                        .color(whiteColor)
                                        .padding(EdgeInsets.only(
                                            left: 10, right: 10))
                                        .customRounded(
                                            BorderRadius.circular(30))
                                        .withShadow([
                                      BoxShadow(
                                          color: darkGreyColor,
                                          blurRadius: 2.0,
                                          offset: Offset(-1.0, 2.0),
                                          spreadRadius: 0.01),
                                    ]).make(),
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return RadialGradient(
                                          center: Alignment.center,
                                          radius: 0.6,
                                          colors: <Color>[
                                            Colors.transparent,
                                            Colors.white
                                          ],
                                          stops: [0.5, 1.0],
                                        ).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcATop,
                                      child: SvgPicture.asset(forward_arrow_svg,
                                              color: mateBlackColor, height: 45)
                                          .opacity(value: 0.5)
                                          .box
                                          .margin(EdgeInsets.only(top: 8))
                                          .make(),
                                    ),
                                    SvgPicture.asset(forward_arrow_svg,
                                        height: 45),
                                    Icon(
                                      CupertinoIcons.chevron_forward,
                                      size: 15,
                                    )
                                  ],
                                ),
                              10.heightBox,
                              if (state is DetailsNutritionSelectState)
                                Column(
                                  children: [
                                    10.heightBox,
                                    Stack(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .recipe!
                                                    .digest![state.index > -1
                                                        ? state.index
                                                        : indx]
                                                    .label,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: blackColor),
                                              ),
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: blackColor,
                                                  size: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).objectCenterLeft(),
                                        Column(
                                          children: [
                                            Text(
                                              "${data.recipe!.digest![state.index > -1 ? state.index : indx].daily!.round()}g                    ${data.recipe!.digest![state.index > -1 ? state.index : indx].total!.round()}%",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            if (state.index < 2) 5.heightBox,
                                            if (state.index < 2)
                                              Container(
                                                height: 1,
                                                color: blackColor,
                                                width: 120,
                                              ),
                                          ],
                                        ).objectCenterRight()
                                      ],
                                    ),
                                    if (state.index < 2)
                                      Expanded(
                                        child: ListView.builder(
                                                itemCount: data
                                                    .recipe!
                                                    .digest![state.index > -1
                                                        ? state.index
                                                        : indx]
                                                    .sub!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(data
                                                          .recipe!
                                                          .digest![
                                                              state.index > -1
                                                                  ? state.index
                                                                  : indx]
                                                          .sub![index]
                                                          .label!),
                                                      Text(
                                                          "${data.recipe!.digest![state.index > -1 ? state.index : indx].sub![index].total!.round()}g                    ${data.recipe!.digest![state.index > -1 ? state.index : indx].sub![index].daily!.round()}%")
                                                    ],
                                                  )
                                                      .box
                                                      .margin(EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 30,
                                                          right: 2))
                                                      .make();
                                                })
                                            .box
                                            .margin(EdgeInsets.only(top: 5))
                                            .make(),
                                      ),
                                  ],
                                )
                                    .box
                                    .color(greenColor)
                                    .height(state.index < 2 ? 150 : 45)
                                    .padding(EdgeInsets.only(
                                        left: 15, right: 15, bottom: 5))
                                    .customRounded(BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)))
                                    .make(),
                              30.heightBox
                            ],
                          )
                              .box
                              .margin(EdgeInsets.only(left: 25, right: 25))
                              .make()
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}
