class NetworkConstant {
  static const _IP = '192.168.1.7';
  static const BASE_URL = 'http://${_IP}:8181/';
  static const SIGN_UP = '${BASE_URL}auth/sign-up';
  static const SIGN_IN = '${BASE_URL}auth/sign-in';
  static const USER = '${BASE_URL}auth/';
  static const POSTS = '${BASE_URL}posts';

  static String getAllPostsUrl(int size, DateTime? cursor) {
    if(cursor == null) {
      return '$POSTS?limit=$size';
    } else if (cursor.toIso8601String().endsWith('Z')) {
      return '$POSTS?limit=$size&cursorCreatedAt=${cursor.toIso8601String()}';
    } else {
      return '$POSTS?limit=$size&cursorCreatedAt=${cursor.toIso8601String()}Z';
    }
    
  }
}
