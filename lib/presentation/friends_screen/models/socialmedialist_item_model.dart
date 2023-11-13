import '../../../core/app_export.dart';

/// This class is used in the [socialmedialist_item_widget] screen.
class SocialmedialistItemModel {
  SocialmedialistItemModel({
    this.twitter,
    this.id,
  }) {
    twitter = twitter ?? ImageConstant.imgTwitterBlue500;
    id = id ?? "";
  }

  String? twitter;

  String? id;
}
