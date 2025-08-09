class NetworkInfo {
  static const _IP = '192.168.1.110';
  static const _PORT = '8181';
}

class HttpConstant {
  static const _IP = NetworkInfo._IP;
  static const _PORT = NetworkInfo._PORT;
  static const BASE_URL = 'http://$_IP:$_PORT/';
  static const SIGN_UP = '${BASE_URL}auth/sign-up';
  static const SIGN_IN = '${BASE_URL}auth/sign-in';
  static const SIGN_OUT = '${BASE_URL}auth/logout';
  static const USER = '${BASE_URL}auth/';
  static const POSTS = '${BASE_URL}posts';
  static const MESSAGES = '${BASE_URL}messages/';
  static String getInteractUrl(int postId) =>
      '${BASE_URL}posts/interact/$postId';

  static String getAllPostsUrl(int size, DateTime? cursor) {
    if (cursor == null) {
      return '$POSTS?limit=$size';
    } else if (cursor.toIso8601String().endsWith('Z')) {
      return '$POSTS?limit=$size&cursorCreatedAt=${cursor.toIso8601String()}';
    } else {
      return '$POSTS?limit=$size&cursorCreatedAt=${cursor.toIso8601String()}Z';
    }
  }

  static String getAllMessagesUrl(int receiverId, int page, int size) {
    return '$MESSAGES$receiverId?page=$page&size=$size';
  }
}

class SocketConstant {
  static const _IP = NetworkInfo._IP;
  static const _PORT = NetworkInfo._PORT;
  static const BASE_SOCKET = 'ws://$_IP:$_PORT/';
  static const CONNECT = '${BASE_SOCKET}app-ws';
  static String getSubscribe(int userId) => '/user/$userId/queue/messages';
  static const SEND = '/app/chat.add-message';
}
