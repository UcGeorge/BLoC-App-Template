// ignore_for_file: must_be_immutable

part of 'stream_bloc.dart';

/// Represents the state of Stream in the application.
class StreamState extends Equatable {
  StreamState({this.streamModelObj});

  StreamModel? streamModelObj;

  @override
  List<Object?> get props => [
        streamModelObj,
      ];
  StreamState copyWith({StreamModel? streamModelObj}) {
    return StreamState(
      streamModelObj: streamModelObj ?? this.streamModelObj,
    );
  }
}
