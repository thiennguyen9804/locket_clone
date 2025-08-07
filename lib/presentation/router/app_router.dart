import 'package:auto_route/auto_route.dart';
import 'package:locket_clone/presentation/router/guard/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Root,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MessageRoute.page),
    AutoRoute(page: ChatRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: UserInfoRoute.page),
    AutoRoute(
      page: TransitionWrapperRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: CameraRoute.page, initial: true),
            AutoRoute(page: ImagePreviewRoute.page),
          ],
        ),
      ],
      guards: [AuthGuard()],
    ),
  ];
}
