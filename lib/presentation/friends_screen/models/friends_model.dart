// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'socialmedialist_item_model.dart';
import 'followlist_item_model.dart';

/// This class defines the variables used in the [friends_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FriendsModel extends Equatable {
  FriendsModel({
    this.socialmedialistItemList = const [],
    this.followlistItemList = const [],
  }) {}

  List<SocialmedialistItemModel> socialmedialistItemList;

  List<FollowlistItemModel> followlistItemList;

  FriendsModel copyWith({
    List<SocialmedialistItemModel>? socialmedialistItemList,
    List<FollowlistItemModel>? followlistItemList,
  }) {
    return FriendsModel(
      socialmedialistItemList:
          socialmedialistItemList ?? this.socialmedialistItemList,
      followlistItemList: followlistItemList ?? this.followlistItemList,
    );
  }

  @override
  List<Object?> get props => [socialmedialistItemList, followlistItemList];
}
