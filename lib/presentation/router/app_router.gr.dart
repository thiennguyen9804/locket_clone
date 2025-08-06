// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/foundation.dart' as _i10;
import 'package:locket_clone/common/widgets/transition_wrapper/transition_wrapper.dart'
    as _i6;
import 'package:locket_clone/presentation/auth/pages/sign_in_screen.dart'
    as _i5;
import 'package:locket_clone/presentation/data/captured_image_data.dart' as _i9;
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart'
    as _i1;
import 'package:locket_clone/presentation/home/camera_screen/image_preview_screen.dart'
    as _i4;
import 'package:locket_clone/presentation/home/chat_screen/chat_screen.dart'
    as _i2;
import 'package:locket_clone/presentation/home/home_root.dart' as _i3;
import 'package:locket_clone/presentation/home/user_info_screen/user_info_screen.dart'
    as _i7;

/// generated route for
/// [_i1.CameraScreen]
class CameraRoute extends _i8.PageRouteInfo<void> {
  const CameraRoute({List<_i8.PageRouteInfo>? children})
    : super(CameraRoute.name, initialChildren: children);

  static const String name = 'CameraRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CameraScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i8.PageRouteInfo<void> {
  const ChatRoute({List<_i8.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeRoot]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeRoot();
    },
  );
}

/// generated route for
/// [_i4.ImagePreviewScreen]
class ImagePreviewRoute extends _i8.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    required _i9.CapturedImageDataBuilder capturedImageDataBuilder,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(
           capturedImageDataBuilder: capturedImageDataBuilder,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i4.ImagePreviewScreen(
        args.capturedImageDataBuilder,
        key: args.key,
      );
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    required this.capturedImageDataBuilder,
    this.key,
  });

  final _i9.CapturedImageDataBuilder capturedImageDataBuilder;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{capturedImageDataBuilder: $capturedImageDataBuilder, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImagePreviewRouteArgs) return false;
    return capturedImageDataBuilder == other.capturedImageDataBuilder &&
        key == other.key;
  }

  @override
  int get hashCode => capturedImageDataBuilder.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInScreen();
    },
  );
}

/// generated route for
/// [_i6.TransitionWrapperScreen]
class TransitionWrapperRoute extends _i8.PageRouteInfo<void> {
  const TransitionWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(TransitionWrapperRoute.name, initialChildren: children);

  static const String name = 'TransitionWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.TransitionWrapperScreen();
    },
  );
}

/// generated route for
/// [_i7.UserInfoScreen]
class UserInfoRoute extends _i8.PageRouteInfo<void> {
  const UserInfoRoute({List<_i8.PageRouteInfo>? children})
    : super(UserInfoRoute.name, initialChildren: children);

  static const String name = 'UserInfoRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.UserInfoScreen();
    },
  );
}
