// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'stories2_item_model.dart';
import 'messages_item_model.dart';

/// This class defines the variables used in the [messages_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MessagesModel extends Equatable {
  MessagesModel({
    this.stories2ItemList = const [],
    this.messagesItemList = const [],
  }) {}

  List<Stories2ItemModel> stories2ItemList;

  List<MessagesItemModel> messagesItemList;

  MessagesModel copyWith({
    List<Stories2ItemModel>? stories2ItemList,
    List<MessagesItemModel>? messagesItemList,
  }) {
    return MessagesModel(
      stories2ItemList: stories2ItemList ?? this.stories2ItemList,
      messagesItemList: messagesItemList ?? this.messagesItemList,
    );
  }

  @override
  List<Object?> get props => [stories2ItemList, messagesItemList];
}
