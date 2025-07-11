import 'package:auto_route/auto_route.dart';
import 'package:locket_clone/presentation/router/app_router.gr.dart';

import '../../../domain/usecases/login_user_use_case.dart';
import '../../../set_up_sl.dart';

class AuthGuard extends AutoRouteGuard {
  final LoginUserUseCase loginUserUseCase = sl<LoginUserUseCase>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      await loginUserUseCase(); // Gọi use case
      // Nếu thành công, lưu user nếu cần
      resolver.next(true); // Cho phép đi tiếp
    } catch (e) {
      router.replace(const SignInRoute());
    }
  }
}
