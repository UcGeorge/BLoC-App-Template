// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'stories1_item_model.dart';
import 'frame_item_model.dart';

/// This class defines the variables used in the [stories_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StoriesModel extends Equatable {
  StoriesModel({
    this.stories1ItemList = const [],
    this.frameItemList = const [],
  }) {}

  List<Stories1ItemModel> stories1ItemList;

  List<FrameItemModel> frameItemList;

  StoriesModel copyWith({
    List<Stories1ItemModel>? stories1ItemList,
    List<FrameItemModel>? frameItemList,
  }) {
    return StoriesModel(
      stories1ItemList: stories1ItemList ?? this.stories1ItemList,
      frameItemList: frameItemList ?? this.frameItemList,
    );
  }

  @override
  List<Object?> get props => [stories1ItemList, frameItemList];
}
