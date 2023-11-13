// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'invitefriends_item_model.dart';

/// This class defines the variables used in the [invite_friends_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InviteFriendsModel extends Equatable {
  InviteFriendsModel({this.invitefriendsItemList = const []}) {}

  List<InvitefriendsItemModel> invitefriendsItemList;

  InviteFriendsModel copyWith(
      {List<InvitefriendsItemModel>? invitefriendsItemList}) {
    return InviteFriendsModel(
      invitefriendsItemList:
          invitefriendsItemList ?? this.invitefriendsItemList,
    );
  }

  @override
  List<Object?> get props => [invitefriendsItemList];
}
