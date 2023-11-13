import '../../../core/app_export.dart';

/// This class is used in the [stream_item_widget] screen.
class StreamItemModel {
  StreamItemModel({
    this.twentySeven,
    this.rosalia,
    this.duration,
    this.rosalia1,
    this.duration1,
    this.id,
  }) {
    twentySeven = twentySeven ?? ImageConstant.img27;
    rosalia = rosalia ?? "Rosalia";
    duration = duration ?? "45 minutes ago";
    rosalia1 = rosalia1 ?? "Rosalia";
    duration1 = duration1 ?? "45 minutes ago";
    id = id ?? "";
  }

  String? twentySeven;

  String? rosalia;

  String? duration;

  String? rosalia1;

  String? duration1;

  String? id;
}
