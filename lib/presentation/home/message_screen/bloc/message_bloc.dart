import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/source/message_api_service.dart';
import 'package:locket_clone/presentation/home/message_screen/bloc/message_event.dart';
import 'package:locket_clone/set_up_sl.dart';

class MessageBloc extends Bloc<MessageEvent, PagingState<int, MessageDto>> {
  late MessageApiServiceImpl messageService;
  MessageBloc() : super(PagingState()) {
    messageService = sl<MessageApiService>() as MessageApiServiceImpl;
    messageService.subcribeSocket((frame) {
      debugPrint('socket frame received: ${frame.body}');
    });
    on<FetchNextMessagesPage>(_fetchNextMessagesPageHandler);
    on<SendMessageEvent>(_sendMessageEvent);
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
        receiverId: event.receiverId,
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
    messageService.sendMessage(receiverId: event.receiverId, text: event.text);
  }
}
