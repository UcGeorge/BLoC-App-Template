// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'stream_item_model.dart';

/// This class defines the variables used in the [stream_page],
/// and is typically used to hold data that is passed between different parts of the application.
class StreamModel extends Equatable {
  StreamModel({this.streamItemList = const []}) {}

  List<StreamItemModel> streamItemList;

  StreamModel copyWith({List<StreamItemModel>? streamItemList}) {
    return StreamModel(
      streamItemList: streamItemList ?? this.streamItemList,
    );
  }

  @override
  List<Object?> get props => [streamItemList];
}
