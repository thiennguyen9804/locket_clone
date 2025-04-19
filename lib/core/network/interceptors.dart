import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    logger.i('➡️ ${options.method} request ==> $requestPath');
    logger.i('🔸 Headers:\n${options.headers}');
    logger.i('🔸 Query Parameters:\n${options.queryParameters}');
    if (options.data != null) {
      logger.i('📝 Body:\n${_prettyJson(options.data)}');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('✅ RESPONSE [${response.statusCode}] ${response.requestOptions.uri}');
    logger.d('📦 Data:\n${_prettyJson(response.data)}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    logger.e('❌ ERROR [${err.response?.statusCode}] ==> $requestPath');
    logger.d('🔸 Error Type: ${err.type}');
    logger.d('🔸 Error Message: ${err.message}');
    if (err.response?.data != null) {
      logger.d('📦 Error Body:\n${_prettyJson(err.response?.data)}');
    }

    handler.next(err);
  }

  String _prettyJson(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      } else {
        return data.toString();
      }
    } catch (e) {
      return data.toString();
    }
  }
}
