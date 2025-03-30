import 'dart:convert';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mmkv/mmkv.dart';

import '../model/sign_in_res/sign_in_res.dart';
import '../model/user_dto/user_dto.dart';

abstract class AuthLocalService {
  UserDto getLocalCurrentUser();
  String getLocalToken();
  Future writeToDb(SignInRes res);
}

class AuthLocalServiceImpl implements AuthLocalService {
  late MMKV mmkv;

  AuthLocalServiceImpl() {
    mmkv = MMKV.defaultMMKV();
  }

  @override
  UserDto getLocalCurrentUser() {
    try {
      String? data = mmkv.decodeString('user');

      if (data == null) {
        throw Exception("No such Element");
      }
      Map<String, dynamic> json = jsonDecode(data);
      UserDto userDto = UserDto.fromJson(json);
      // if (kDebugMode) {
      //   print('user type: ${data.runtimeType}');
      //   print('user: $data');
      // }
      return userDto;
    } catch (e) {
      rethrow;
    }
  }

  Future _writeToDb(SignInRes signInRes) async {
    try {
      final token = signInRes.token;
      final userDto = signInRes.user;
      String jsonString = jsonEncode(userDto.toJson());
      mmkv.encodeString("user", jsonString);
      mmkv.encodeString("token", token);
      if (kDebugMode) {
        print('write to db successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('failed to write to db');
      }
    }
  }

  @override
  Future writeToDb(SignInRes signInRes) async {
    await _writeToDb(signInRes);
  }

  @override
  String getLocalToken() {
    try {
      String? data = mmkv.decodeString('token');
      if (data == null) {
        if (kDebugMode) {
          print('user not found in local db, $data');
        }
        throw Exception("No such Element");
      }
      if (kDebugMode) {}
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
