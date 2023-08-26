import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recipe_search_and_diet/viewAndViewModel/itemDetails/itemDetailsPage.dart';

import '../../../model/itemsModel.dart';
import '../../../network/network_api_service.dart';

part 'search_items_event.dart';

part 'search_items_state.dart';

class SearchItemsBloc extends Bloc<SearchItemsEvent, SearchItemsState> {
  final network_api_service _networkService = new network_api_service();
  itemsModel? data;

  SearchItemsBloc() : super(SearchItemsInitial()) {
    on<SearchTextEvent>(searchTextEvent);
  }

  FutureOr<void> searchTextEvent(
      SearchTextEvent event, Emitter<SearchItemsState> emit) async {
    var json_value = await _networkService.getApi(event.txt);
    data = itemsModelFromJson((json_value).toString());
    emit(SearchTextState(data!));
  }
}
