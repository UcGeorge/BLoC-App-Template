import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profiles_item_model.dart';
import 'package:george_u_s_application1/presentation/discover_page/models/discover_model.dart';
part 'discover_event.dart';
part 'discover_state.dart';

/// A bloc that manages the state of a Discover according to the event that is dispatched to it.
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc(DiscoverState initialState) : super(initialState) {
    on<DiscoverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DiscoverInitialEvent event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(state.copyWith(
        discoverModelObj: state.discoverModelObj?.copyWith(
      profilesItemList: fillProfilesItemList(),
    )));
  }

  List<ProfilesItemModel> fillProfilesItemList() {
    return [
      ProfilesItemModel(
          nineteen: ImageConstant.img19, agnessMonica: "Agness Monica"),
      ProfilesItemModel(nineteen: ImageConstant.img19179x147),
      ProfilesItemModel(
          nineteen: ImageConstant.img191, agnessMonica: "Windy Wandah")
    ];
  }
}
