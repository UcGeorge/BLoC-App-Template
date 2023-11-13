import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/notifications_item_model.dart';
import '../models/notifications_model.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

/// A bloc that manages the state of a Notifications according to the event that is dispatched to it.
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(NotificationsState initialState) : super(initialState) {
    on<NotificationsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsInitialEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(
        notificationsModelObj: state.notificationsModelObj
            ?.copyWith(notificationsItemList: fillNotificationsItemList())));
  }

  List<NotificationsItemModel> fillNotificationsItemList() {
    return [
      NotificationsItemModel(
          image: ImageConstant.imgEllipse22,
          kevinHasFollowed: "Kevin has followed you",
          duration: "1 hour ago"),
      NotificationsItemModel(
          image: ImageConstant.imgEllipse2254x52,
          kevinHasFollowed:
              "Arman has commented on your story\n “hey there” to your timeline",
          duration: "2 hours ago"),
      NotificationsItemModel(image: ImageConstant.imgEllipse221),
      NotificationsItemModel(
          image: ImageConstant.imgEllipse222,
          kevinHasFollowed:
              "Arman has commented on your story\n “hey there” to your timeline",
          duration: "2 hours ago"),
      NotificationsItemModel(
          image: ImageConstant.imgEllipse22,
          kevinHasFollowed:
              "Arman has commented on your story\n “hey there” to your timeline",
          duration: "2 hours ago")
    ];
  }
}
