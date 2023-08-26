part of 'search_items_bloc.dart';

@immutable
abstract class SearchItemsState {}

class SearchItemsInitial extends SearchItemsState {}


class SearchTextState extends SearchItemsState {
  itemsModel data;
  SearchTextState(this.data);
}
