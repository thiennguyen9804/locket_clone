class NetworkConstant {
  static const BASE_URL = 'http://10.0.149.211:8181/';
  static const SIGN_UP = '${BASE_URL}auth/sign-up';
  static const SIGN_IN = '${BASE_URL}auth/sign-in';
  static const USER = '${BASE_URL}auth/';
  static const ALL_POSTS = '${BASE_URL}posts';

  static String getAllPostsUrl(int size, int page) {
    return '${ALL_POSTS}?size=${size}&page=${page}';
  }
}
