part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsState {}

class ItemDetailsInitial extends ItemDetailsState {}

class DetailsNutritionSelectState extends ItemDetailsState{
  int index;
  DetailsNutritionSelectState(this.index);
}