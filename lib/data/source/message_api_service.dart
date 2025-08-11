import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locket_clone/core/constant/network_constant.dart';
import 'package:locket_clone/core/network/dio_client.dart';
import 'package:locket_clone/data/model/message_dto/message_dto.dart';
import 'package:locket_clone/data/model/sent_message_dto/send_message_dto.dart';
import 'package:locket_clone/data/source/auth_local_service.dart';
import 'package:locket_clone/set_up_sl.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

abstract class MessageApiService {
  Future<List<MessageDto>> getAllMessagesWithUser({
    required int receiverId,
    int size = 20,
    int page = 0,
  });

  Future<List<MessageDto>> getAllMessages();

  Future sendMessage(SendMessageDto dto);
}

class MessageApiServiceImpl implements MessageApiService {
  final StompClient stomp;

  MessageApiServiceImpl(this.stomp);
  @override
  Future<List<MessageDto>> getAllMessagesWithUser({
    required int receiverId,
    int size = 20,
    int page = 0,
  }) async {
    try {
      final token = sl<AuthLocalService>().getLocalToken();
      final response = await sl<DioClient>().get(
        HttpConstant.getAllMessagesUrl(receiverId, page, size),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final List list = response.data['content'];
      final List<MessageDto> res = [];
      for (var item in list) {
        res.add(MessageDto.fromJson(item));
      }
      return res;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    throw Exception();
  }

  void subcribeSocket(Function(StompFrame) cb) {
    final userId = sl<AuthLocalService>().getLocalCurrentUser().id;
    stomp.subscribe(
      destination: SocketConstant.getSubscribe(userId),
      callback: cb,
    );
  }

  @override
  Future sendMessage(SendMessageDto dto) async {
    final body = dto.toJson();
    stomp.send(destination: SocketConstant.SEND, body: jsonEncode(body));
  }

  @override
  Future<List<MessageDto>> getAllMessages() async {
    final token = sl<AuthLocalService>().getLocalToken();
    final response = await sl<DioClient>().get(
      HttpConstant.MESSAGES,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final List list = response.data;
    final List<MessageDto> res = [];
    for (var item in list) {
      res.add(MessageDto.fromJson(item));
    }

    return res;
  }
}
