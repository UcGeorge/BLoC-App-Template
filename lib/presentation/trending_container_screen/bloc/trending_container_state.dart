// ignore_for_file: must_be_immutable

part of 'trending_container_bloc.dart';

/// Represents the state of TrendingContainer in the application.
class TrendingContainerState extends Equatable {
  TrendingContainerState({this.trendingContainerModelObj});

  TrendingContainerModel? trendingContainerModelObj;

  @override
  List<Object?> get props => [
        trendingContainerModelObj,
      ];
  TrendingContainerState copyWith(
      {TrendingContainerModel? trendingContainerModelObj}) {
    return TrendingContainerState(
      trendingContainerModelObj:
          trendingContainerModelObj ?? this.trendingContainerModelObj,
    );
  }
}
