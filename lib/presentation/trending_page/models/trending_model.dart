// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'trendingposts_item_model.dart';

/// This class defines the variables used in the [trending_page],
/// and is typically used to hold data that is passed between different parts of the application.
class TrendingModel extends Equatable {
  TrendingModel({this.trendingpostsItemList = const []}) {}

  List<TrendingpostsItemModel> trendingpostsItemList;

  TrendingModel copyWith(
      {List<TrendingpostsItemModel>? trendingpostsItemList}) {
    return TrendingModel(
      trendingpostsItemList:
          trendingpostsItemList ?? this.trendingpostsItemList,
    );
  }

  @override
  List<Object?> get props => [trendingpostsItemList];
}
