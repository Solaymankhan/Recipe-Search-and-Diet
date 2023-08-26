import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  ItemDetailsBloc() : super(ItemDetailsInitial()) {
    on<DetailsNutritionSelectEvent>(detailsNutritionSelectEvent);
  }

  FutureOr<void> detailsNutritionSelectEvent(DetailsNutritionSelectEvent event, Emitter<ItemDetailsState> emit) {
  emit(DetailsNutritionSelectState(event.index));
  }
}
