import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/stories1_item_model.dart';
import '../models/frame_item_model.dart';
import '../models/stories_model.dart';
part 'stories_event.dart';
part 'stories_state.dart';

/// A bloc that manages the state of a Stories according to the event that is dispatched to it.
class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc(StoriesState initialState) : super(initialState) {
    on<StoriesInitialEvent>(_onInitialize);
  }

  List<Stories1ItemModel> fillStories1ItemList() {
    return [
      Stories1ItemModel(roy: ImageConstant.imgEllipse15, roy1: "Roy"),
      Stories1ItemModel(roy: ImageConstant.imgEllipse22, roy1: "Jordan"),
      Stories1ItemModel(roy: ImageConstant.imgEllipse26, roy1: "Chrystin"),
      Stories1ItemModel(roy: ImageConstant.imgEllipse28, roy1: "Vrindha"),
      Stories1ItemModel(roy1: "Angeline")
    ];
  }

  List<FrameItemModel> fillFrameItemList() {
    return [
      FrameItemModel(
          lIVEWeTheFest: ImageConstant.img19144x147,
          lIVEWeTheFest1: "LIVE - We The Fest",
          price: "19 : 00 | Forg Stadium"),
      FrameItemModel(
          lIVEWeTheFest1: "Merry New Year", price: "21 : 00 | Latuna Beach"),
      FrameItemModel(
          lIVEWeTheFest1: "Blue Loyal Party", price: "19 : 35 | Latuna Beach")
    ];
  }

  _onInitialize(
    StoriesInitialEvent event,
    Emitter<StoriesState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        storiesModelObj: state.storiesModelObj?.copyWith(
      stories1ItemList: fillStories1ItemList(),
      frameItemList: fillFrameItemList(),
    )));
  }
}
