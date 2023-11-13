import '../../../core/app_export.dart';

/// This class is used in the [notifications_item_widget] screen.
class NotificationsItemModel {
  NotificationsItemModel({
    this.image,
    this.kevinHasFollowed,
    this.duration,
    this.id,
  }) {
    image = image ?? ImageConstant.imgEllipse22;
    kevinHasFollowed = kevinHasFollowed ?? "Kevin has followed you";
    duration = duration ?? "1 hour ago";
    id = id ?? "";
  }

  String? image;

  String? kevinHasFollowed;

  String? duration;

  String? id;
}
