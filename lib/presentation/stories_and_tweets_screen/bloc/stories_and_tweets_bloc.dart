import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/live_item_model.dart';
import '../models/frame1_item_model.dart';
import '../models/stories_and_tweets_model.dart';
part 'stories_and_tweets_event.dart';
part 'stories_and_tweets_state.dart';

/// A bloc that manages the state of a StoriesAndTweets according to the event that is dispatched to it.
class StoriesAndTweetsBloc
    extends Bloc<StoriesAndTweetsEvent, StoriesAndTweetsState> {
  StoriesAndTweetsBloc(StoriesAndTweetsState initialState)
      : super(initialState) {
    on<StoriesAndTweetsInitialEvent>(_onInitialize);
  }

  List<LiveItemModel> fillLiveItemList() {
    return [
      LiveItemModel(send: ImageConstant.imgSend, newPost: "New Post"),
      LiveItemModel(newPost: "Jordan"),
      LiveItemModel(newPost: "Angeline"),
      LiveItemModel(newPost: "Chrystin"),
      LiveItemModel(newPost: "Vrindha")
    ];
  }

  List<Frame1ItemModel> fillFrame1ItemList() {
    return [
      Frame1ItemModel(
          albertOConnor: "Albert O’connor",
          duration: "4  hours ago",
          introduceIAmA:
              "Introduce I am a photographer who travels around the world everyday, these are some of my works as a photographer.",
          zipcode: "2200",
          eightHundred: "800"),
      Frame1ItemModel(
          albertOConnor: "Albert O’connor",
          duration: "4  hours ago",
          introduceIAmA:
              "Introduce I am a photographer who travels around the world everyday, these are some of my works as a photographer.",
          zipcode: "2200",
          eightHundred: "800")
    ];
  }

  _onInitialize(
    StoriesAndTweetsInitialEvent event,
    Emitter<StoriesAndTweetsState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        storiesAndTweetsModelObj: state.storiesAndTweetsModelObj?.copyWith(
            liveItemList: fillLiveItemList(),
            frame1ItemList: fillFrame1ItemList())));
  }
}
