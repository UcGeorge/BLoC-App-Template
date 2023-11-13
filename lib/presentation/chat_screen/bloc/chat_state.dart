// ignore_for_file: must_be_immutable

part of 'chat_bloc.dart';

/// Represents the state of Chat in the application.
class ChatState extends Equatable {
  ChatState({
    this.commentController,
    this.chatModelObj,
  });

  TextEditingController? commentController;

  ChatModel? chatModelObj;

  @override
  List<Object?> get props => [
        commentController,
        chatModelObj,
      ];
  ChatState copyWith({
    TextEditingController? commentController,
    ChatModel? chatModelObj,
  }) {
    return ChatState(
      commentController: commentController ?? this.commentController,
      chatModelObj: chatModelObj ?? this.chatModelObj,
    );
  }
}
