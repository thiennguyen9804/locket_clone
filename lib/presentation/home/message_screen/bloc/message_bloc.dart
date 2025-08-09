import 'dart:async';
import 'dart:convert';

import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:locket_clone/core/mapper/post_mapper/post_mapper.dart';
import 'package:locket_clone/core/mapper/user_mapper/user_mapper.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/post_dto/post_dto.dart';
import 'package:locket_clone/data/model/sent_message_dto/send_message_dto.dart';
import 'package:locket_clone/data/model/user_dto/user_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/data/source/message_api_service.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/entities/user_entity.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_event.dart';
import 'package:locket_clone/set_up_sl.dart';

class MessageBloc extends Bloc<MessageEvent, PagingState<int, MessageDto>> {
  late MessageApiServiceImpl messageService;
  MessageBloc() : super(PagingState()) {
    messageService = sl<MessageApiService>() as MessageApiServiceImpl;
    messageService.subcribeSocket((frame) {
      final message = MessageDto.fromJson(jsonDecode(frame.body!));
      add(AddNewMessageEvent(message));
    });
    on<FetchNextMessagesPage>(_fetchNextMessagesPageHandler);
    on<SendMessageEvent>(_sendMessageEvent);
    on<AddNewMessageEvent>(_addNewMessageHandler);
  }

  Future _fetchNextMessagesPageHandler(
    FetchNextMessagesPage event,
    Emitter<PagingState<int, MessageDto>> emit,
  ) async {
    final state = this.state;
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final newKey = (state.keys?.last ?? -1) + 1;
      final newItems = await sl<MessageApiService>().getAllMessages(
        page: newKey,
        receiverId: event.receiver.id,
      );
      final isLastPage = newItems.isEmpty;

      emit(
        state.copyWith(
          pages: [...?state.pages, newItems],
          keys: [...?state.keys, newKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        ),
      );
    } catch (error) {
      debugPrint("message bloc error: $error");
      emit(state.copyWith(error: error, isLoading: false));
    }
  }

  FutureOr<void> _sendMessageEvent(
    SendMessageEvent event,
    Emitter<PagingState<int, MessageDto>> emit,
  ) {
    final sendDto = SendMessageDto(
      text: event.text,
      receiverId: event.receiver.id,
      post: sl<PostMapper>().convert<PostEntity, PostDto>(event.post),
    );
    messageService.sendMessage(sendDto);
    final receiverDto = sl<UserMapper>().convert<UserEntity, UserDto>(
      event.receiver,
    );
    final message = MessageDto(
      text: event.text,
      sender: sl<AuthLocalService>().getLocalCurrentUser(),
      receiver: receiverDto,
      imageUrl: null,
      createdAt: DateTime.now(),
    );

    add(AddNewMessageEvent(message));
  }

  FutureOr<void> _addNewMessageHandler(
    AddNewMessageEvent event,
    Emitter<PagingState<int, MessageDto>> emit,
  ) {
    emit(
      state.copyWith(
        pages: [
          [event.newMessage],
          ...?state.pages,
        ],
        keys: [state.keys!.last, ...?state.keys],
        isLoading: false,
      ),
    );
  }
}
