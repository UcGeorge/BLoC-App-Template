// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'postitem_item_model.dart';

/// This class defines the variables used in the [trending_posts_page],
/// and is typically used to hold data that is passed between different parts of the application.
class TrendingPostsModel extends Equatable {
  TrendingPostsModel({this.postitemItemList = const []}) {}

  List<PostitemItemModel> postitemItemList;

  TrendingPostsModel copyWith({List<PostitemItemModel>? postitemItemList}) {
    return TrendingPostsModel(
      postitemItemList: postitemItemList ?? this.postitemItemList,
    );
  }

  @override
  List<Object?> get props => [postitemItemList];
}
