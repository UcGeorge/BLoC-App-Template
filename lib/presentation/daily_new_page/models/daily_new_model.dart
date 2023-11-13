// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'profiles1_item_model.dart';
import 'forty_item_model.dart';

/// This class defines the variables used in the [daily_new_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DailyNewModel extends Equatable {
  DailyNewModel({
    this.profiles1ItemList = const [],
    this.fortyItemList = const [],
  }) {}

  List<Profiles1ItemModel> profiles1ItemList;

  List<FortyItemModel> fortyItemList;

  DailyNewModel copyWith({
    List<Profiles1ItemModel>? profiles1ItemList,
    List<FortyItemModel>? fortyItemList,
  }) {
    return DailyNewModel(
      profiles1ItemList: profiles1ItemList ?? this.profiles1ItemList,
      fortyItemList: fortyItemList ?? this.fortyItemList,
    );
  }

  @override
  List<Object?> get props => [profiles1ItemList, fortyItemList];
}
