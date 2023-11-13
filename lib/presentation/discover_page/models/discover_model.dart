// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'profiles_item_model.dart';

/// This class defines the variables used in the [discover_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverModel extends Equatable {
  DiscoverModel({this.profilesItemList = const []}) {}

  List<ProfilesItemModel> profilesItemList;

  DiscoverModel copyWith({List<ProfilesItemModel>? profilesItemList}) {
    return DiscoverModel(
      profilesItemList: profilesItemList ?? this.profilesItemList,
    );
  }

  @override
  List<Object?> get props => [profilesItemList];
}
