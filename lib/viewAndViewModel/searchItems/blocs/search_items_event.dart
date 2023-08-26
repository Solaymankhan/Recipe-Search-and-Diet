part of 'search_items_bloc.dart';

@immutable
abstract class SearchItemsEvent {}

class SearchTextEvent extends SearchItemsEvent{
  var txt;
  SearchTextEvent(this.txt);
}
