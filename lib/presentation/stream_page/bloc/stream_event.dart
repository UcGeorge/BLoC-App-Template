// ignore_for_file: must_be_immutable

part of 'stream_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Stream widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StreamEvent extends Equatable {}

/// Event that is dispatched when the Stream widget is first created.
class StreamInitialEvent extends StreamEvent {
  @override
  List<Object?> get props => [];
}
