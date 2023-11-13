import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:george_u_s_application1/presentation/live_screen/models/live_model.dart';
part 'live_event.dart';
part 'live_state.dart';

/// A bloc that manages the state of a Live according to the event that is dispatched to it.
class LiveBloc extends Bloc<LiveEvent, LiveState> {
  LiveBloc(LiveState initialState) : super(initialState) {
    on<LiveInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LiveInitialEvent event,
    Emitter<LiveState> emit,
  ) async {
    emit(state.copyWith(
      commentController: TextEditingController(),
    ));
  }
}
