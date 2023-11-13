import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';
import '../models/invite_friends_model.dart';
import '../models/invitefriends_item_model.dart';

part 'invite_friends_event.dart';
part 'invite_friends_state.dart';

/// A bloc that manages the state of a InviteFriends according to the event that is dispatched to it.
class InviteFriendsBloc extends Bloc<InviteFriendsEvent, InviteFriendsState> {
  InviteFriendsBloc(InviteFriendsState initialState) : super(initialState) {
    on<InviteFriendsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    InviteFriendsInitialEvent event,
    Emitter<InviteFriendsState> emit,
  ) async {
    emit(state.copyWith(
        inviteFriendsModelObj: state.inviteFriendsModelObj
            ?.copyWith(invitefriendsItemList: fillInvitefriendsItemList())));
  }

  List<InvitefriendsItemModel> fillInvitefriendsItemList() {
    return [
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse5,
          kevinAllsrub1: "Kevin Allsrub",
          yourEFriendsOn: "Your’e friends on twitter",
          checkmark: ImageConstant.imgCheckmark),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse6,
          kevinAllsrub1: "Sarah Owen",
          yourEFriendsOn: "Your’e friends on twitter"),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse7,
          kevinAllsrub1: "Rick Onad",
          yourEFriendsOn: "Your’e friends on twitter"),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse8,
          kevinAllsrub1: "Steven Ford",
          yourEFriendsOn: "Your’e friends on twitter",
          checkmark: ImageConstant.imgCheckmark),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse9,
          kevinAllsrub1: "Lucas Anna ",
          yourEFriendsOn: "Your’e friends on twitter",
          checkmark: ImageConstant.imgCheckmark),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse10,
          kevinAllsrub1: "Nabila Remaar",
          yourEFriendsOn: "Your’e friends on twitter",
          checkmark: ImageConstant.imgCheckmark),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse11,
          kevinAllsrub1: "Rosalia",
          yourEFriendsOn: "Your’e friends on twitter"),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse12,
          kevinAllsrub1: "Albert O’connor",
          yourEFriendsOn: "Your’e friends on twitter"),
      InvitefriendsItemModel(
          kevinAllsrub: ImageConstant.imgEllipse13,
          kevinAllsrub1: "Melvin Klein",
          yourEFriendsOn: "Your’e friends on twitter",
          checkmark: ImageConstant.imgCheckmark)
    ];
  }
}
