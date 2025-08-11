import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/presentation/router/guard/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Root,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        // you get an animation object and a widget
        // make your own transition
        return ScaleTransition(scale: animation, child: child);
      },
      page: MessageRoute.page,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page: ChatRoute.page,
    ),
    AutoRoute(page: SignInRoute.page),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideRight,
      page: UserInfoRoute.page,
    ),
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
