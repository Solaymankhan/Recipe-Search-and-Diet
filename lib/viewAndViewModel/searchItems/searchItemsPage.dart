import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_and_diet/utils/shapes/roundedSmallSvgIconButton.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/shapes/itemsCart.dart';
import '../itemDetails/itemDetailsPage.dart';
import 'blocs/search_items_bloc.dart';

class searchItemsPage extends StatefulWidget {
  searchItemsPage({Key? key}) : super(key: key);

  @override
  State<searchItemsPage> createState() => _searchItemsPageState();
}

class _searchItemsPageState extends State<searchItemsPage> {
  final SearchItemsBloc searchItemsBloc = new SearchItemsBloc();

  @override
  void initState() {
    super.initState();
    searchItemsBloc.add(SearchTextEvent("all"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchItemsBloc, SearchItemsState>(
      bloc: searchItemsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [whiteColor, greyColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
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
                    border: Border.all(color: darkGrey2Color, width: 0.5),
                    borderRadius: BorderRadius.circular(100),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        spreadRadius: -5.0,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  prefixIcon: Container(),
                  onChanged: (val) {
                    EasyDebounce.debounce(
                        'search_debounce',
                        Duration(milliseconds: 500),
                        () => searchItemsBloc.add(SearchTextEvent(val.length > 0
                            ? val
                            : "all")) // <-- The target method
                        );
                  },
                ))
              ],
            ),
            actions: [
              roundedSmallSvgIconButton(
                  icon: bar_2_svg,
                  icon_clr: Colors.grey,
                  btn_clr: Colors.transparent,
                  onTap: () {}),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                3.heightBox,
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: darkGrey2Color, width: 0.5),
                    color: lightGreyColor,
                  ),
                ),
                if (state is SearchTextState)
                  Expanded(
                    child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200, mainAxisExtent: 195),
                            itemCount:
                                state.data!.hits!.length < state.data!.to!
                                    ? state.data!.hits!.length
                                    : state.data!.to!,
                            itemBuilder: (contxt, index) {
                              return itemsCart(
                                img: state.data!.hits![index].recipe!.image
                                    .toString(),
                                top_title:
                                    state.data!.hits![index].recipe!.label,
                                bottom_title:
                                    state.data!.hits![index].recipe!.source,
                                cal: state.data!.hits![index].recipe!.calories!
                                    .round()
                                    .toString(),
                                ingr: state.data!.hits![index].recipe!
                                    .ingredients!.length
                                    .toString(),
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => itemDetailsPage(
                                          data: state.data!.hits![index])));
                                },
                              );
                            })
                        .box
                        .margin(EdgeInsets.only(left: 25, right: 25))
                        .make(),
                  )
                else
                  Expanded(
                      child: Center(
                    child: CircularProgressIndicator()
                        .box
                        .height(20)
                        .width(20)
                        .make(),
                  )),
              ],
            ),
          ),
        );
      },
    );
  }
}
