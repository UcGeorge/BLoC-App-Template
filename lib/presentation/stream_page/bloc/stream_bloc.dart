import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/stream_item_model.dart';
import '../models/stream_model.dart';
part 'stream_event.dart';
part 'stream_state.dart';

/// A bloc that manages the state of a Stream according to the event that is dispatched to it.
class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc(StreamState initialState) : super(initialState) {
    on<StreamInitialEvent>(_onInitialize);
  }

  _onInitialize(
    StreamInitialEvent event,
    Emitter<StreamState> emit,
  ) async {
    emit(state.copyWith(
        streamModelObj: state.streamModelObj?.copyWith(
      streamItemList: fillStreamItemList(),
    )));
  }

  List<StreamItemModel> fillStreamItemList() {
    return [
      StreamItemModel(
          twentySeven: ImageConstant.img27,
          rosalia: "Rosalia",
          duration: "45 minutes ago",
          rosalia1: "Rosalia",
          duration1: "45 minutes ago")
    ];
  }
}
