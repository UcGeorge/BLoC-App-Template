// ignore_for_file: must_be_immutable

part of 'trending_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TrendingContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TrendingContainerEvent extends Equatable {}

/// Event that is dispatched when the TrendingContainer widget is first created.
class TrendingContainerInitialEvent extends TrendingContainerEvent {
  @override
  List<Object?> get props => [];
}
