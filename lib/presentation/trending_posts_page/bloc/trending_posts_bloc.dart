import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/postitem_item_model.dart';
import '../models/trending_posts_model.dart';
part 'trending_posts_event.dart';
part 'trending_posts_state.dart';

/// A bloc that manages the state of a TrendingPosts according to the event that is dispatched to it.
class TrendingPostsBloc extends Bloc<TrendingPostsEvent, TrendingPostsState> {
  TrendingPostsBloc(TrendingPostsState initialState) : super(initialState) {
    on<TrendingPostsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TrendingPostsInitialEvent event,
    Emitter<TrendingPostsState> emit,
  ) async {
    emit(state.copyWith(
        trendingPostsModelObj: state.trendingPostsModelObj
            ?.copyWith(postitemItemList: fillPostitemItemList())));
  }

  List<PostitemItemModel> fillPostitemItemList() {
    return [
      PostitemItemModel(
          rizalReynaldhi: "Rizal Reynaldhi",
          duration: "35 minutes ago",
          description:
              "Vacation to Bali is my biggest dream because I want to enjoy the beauty of the beach called Kute, hopefully my dream will come true",
          bali: "#Bali",
          dreams: "#dreams",
          zipcode: "2200",
          eightHundred: "800"),
      PostitemItemModel(
          rizalReynaldhi: "Rizal Reynaldhi",
          duration: "35 minutes ago",
          description:
              "Vacation to Bali is my biggest dream because I want to enjoy the beauty of the beach called Kute, hopefully my dream will come true",
          bali: "#Bali",
          dreams: "#dreams",
          zipcode: "2200",
          eightHundred: "800")
    ];
  }
}
