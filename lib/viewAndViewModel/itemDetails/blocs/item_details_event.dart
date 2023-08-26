part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsEvent {}



class DetailsNutritionSelectEvent extends ItemDetailsEvent{
  int index;
  DetailsNutritionSelectEvent(this.index);
}