import '../../../core/app_export.dart';

/// This class is used in the [frame_item_widget] screen.
class FrameItemModel {
  FrameItemModel({
    this.lIVEWeTheFest,
    this.lIVEWeTheFest1,
    this.price,
    this.id,
  }) {
    lIVEWeTheFest = lIVEWeTheFest ?? ImageConstant.img19144x147;
    lIVEWeTheFest1 = lIVEWeTheFest1 ?? "LIVE - We The Fest";
    price = price ?? "19 : 00 | Forg Stadium";
    id = id ?? "";
  }

  String? lIVEWeTheFest;

  String? lIVEWeTheFest1;

  String? price;

  String? id;
}
