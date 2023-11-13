import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/pageview_item_model.dart';
import '../models/page_view_model.dart';
part 'page_view_event.dart';
part 'page_view_state.dart';

/// A bloc that manages the state of a PageView according to the event that is dispatched to it.
class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  PageViewBloc(PageViewState initialState) : super(initialState) {
    on<PageViewInitialEvent>(_onInitialize);
  }

  List<PageviewItemModel> fillPageviewItemList() {
    return List.generate(6, (index) => PageviewItemModel());
  }

  _onInitialize(
    PageViewInitialEvent event,
    Emitter<PageViewState> emit,
  ) async {
    emit(state.copyWith(commentController: TextEditingController()));
    emit(state.copyWith(
        pageViewModelObj: state.pageViewModelObj
            ?.copyWith(pageviewItemList: fillPageviewItemList())));
  }
}
