import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profiles1_item_model.dart';
import '../models/forty_item_model.dart';
import '../models/daily_new_model.dart';
part 'daily_new_event.dart';
part 'daily_new_state.dart';

/// A bloc that manages the state of a DailyNew according to the event that is dispatched to it.
class DailyNewBloc extends Bloc<DailyNewEvent, DailyNewState> {
  DailyNewBloc(DailyNewState initialState) : super(initialState) {
    on<DailyNewInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DailyNewInitialEvent event,
    Emitter<DailyNewState> emit,
  ) async {
    emit(state.copyWith(
        dailyNewModelObj: state.dailyNewModelObj?.copyWith(
      profiles1ItemList: fillProfiles1ItemList(),
      fortyItemList: fillFortyItemList(),
    )));
  }

  List<Profiles1ItemModel> fillProfiles1ItemList() {
    return [
      Profiles1ItemModel(
          nineteen: ImageConstant.img19, agnessMonica: "Agness Monica"),
      Profiles1ItemModel(nineteen: ImageConstant.img19179x147),
      Profiles1ItemModel(
          nineteen: ImageConstant.img191, agnessMonica: "Windy Wandah")
    ];
  }

  List<FortyItemModel> fillFortyItemList() {
    return [
      FortyItemModel(forty: ImageConstant.img40),
      FortyItemModel(forty: ImageConstant.img34)
    ];
  }
}
