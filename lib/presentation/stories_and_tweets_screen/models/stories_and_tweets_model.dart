// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'live_item_model.dart';
import 'frame1_item_model.dart';

/// This class defines the variables used in the [stories_and_tweets_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StoriesAndTweetsModel extends Equatable {
  StoriesAndTweetsModel({
    this.liveItemList = const [],
    this.frame1ItemList = const [],
  }) {}

  List<LiveItemModel> liveItemList;

  List<Frame1ItemModel> frame1ItemList;

  StoriesAndTweetsModel copyWith({
    List<LiveItemModel>? liveItemList,
    List<Frame1ItemModel>? frame1ItemList,
  }) {
    return StoriesAndTweetsModel(
      liveItemList: liveItemList ?? this.liveItemList,
      frame1ItemList: frame1ItemList ?? this.frame1ItemList,
    );
  }

  @override
  List<Object?> get props => [liveItemList, frame1ItemList];
}
