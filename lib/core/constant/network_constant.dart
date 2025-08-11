class NetworkInfo {
  static const _IP = '10.0.2.2';
  static const _PORT = '8181';
  static const DOMAIN = 'bed82717e97e.ngrok-free.app';
}

class HttpConstant {
  static const DOMAIN = NetworkInfo.DOMAIN;
  static const BASE_URL = 'https://$DOMAIN';
  static const SIGN_UP = '$BASE_URL/auth/sign-up';
  static const SIGN_IN = '$BASE_URL/auth/sign-in';
  static const SIGN_OUT = '$BASE_URL/auth/logout';
  static const USER = '$BASE_URL/auth/';
  static const POSTS = '$BASE_URL/posts';
  static const MESSAGES = '${BASE_URL}/messages';
  static String getInteractUrl(int postId) =>
      '$BASE_URL/posts/interact/$postId';

  static String getAllPostsUrl(int size, DateTime? cursor) {
    if (cursor == null) {
      return '$POSTS?limit=$size';
    } else if (true) {
      return '$POSTS?limit=$size&cursorCreatedAt=${cursor.toUtc().toIso8601String()}';
    }
  }

  static String getAllMessagesUrl(int receiverId, int page, int size) {
    return '$MESSAGES/$receiverId?page=$page&size=$size';
  }
}

class SocketConstant {
  static const DOMAIN = NetworkInfo.DOMAIN;
  static const BASE_SOCKET = 'wss://$DOMAIN';
  static const CONNECT = '${BASE_SOCKET}/app-ws';
  static String getSubscribe(int userId) => '/user/$userId/queue/messages';
  static const SEND = '/app/chat.add-message';
}
