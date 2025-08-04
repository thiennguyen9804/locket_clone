// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i9;
import 'package:locket_clone/common/widgets/transition_wrapper/transition_wrapper.dart'
    as _i5;
import 'package:locket_clone/presentation/auth/pages/sign_in_screen.dart'
    as _i4;
import 'package:locket_clone/presentation/data/captured_image_data.dart' as _i8;
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart'
    as _i1;
import 'package:locket_clone/presentation/home/camera_screen/image_preview_screen.dart'
    as _i3;
import 'package:locket_clone/presentation/home/home_root.dart' as _i2;
import 'package:locket_clone/presentation/home/user_info_screen/user_info_screen.dart'
    as _i6;

/// generated route for
/// [_i1.CameraScreen]
class CameraRoute extends _i7.PageRouteInfo<void> {
  const CameraRoute({List<_i7.PageRouteInfo>? children})
    : super(CameraRoute.name, initialChildren: children);

  static const String name = 'CameraRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.CameraScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeRoot]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeRoot();
    },
  );
}

/// generated route for
/// [_i3.ImagePreviewScreen]
class ImagePreviewRoute extends _i7.PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    required _i8.CapturedImageDataBuilder capturedImageDataBuilder,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(
           capturedImageDataBuilder: capturedImageDataBuilder,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImagePreviewRouteArgs>();
      return _i7.WrappedRoute(
        child: _i3.ImagePreviewScreen(
          args.capturedImageDataBuilder,
          key: args.key,
        ),
      );
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    required this.capturedImageDataBuilder,
    this.key,
  });

  final _i8.CapturedImageDataBuilder capturedImageDataBuilder;

  final _i9.Key? key;

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
/// [_i4.SignInScreen]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignInScreen();
    },
  );
}

/// generated route for
/// [_i5.TransitionWrapperScreen]
class TransitionWrapperRoute extends _i7.PageRouteInfo<void> {
  const TransitionWrapperRoute({List<_i7.PageRouteInfo>? children})
    : super(TransitionWrapperRoute.name, initialChildren: children);

  static const String name = 'TransitionWrapperRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.TransitionWrapperScreen();
    },
  );
}

/// generated route for
/// [_i6.UserInfoScreen]
class UserInfoRoute extends _i7.PageRouteInfo<UserInfoRouteArgs> {
  UserInfoRoute({_i9.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        UserInfoRoute.name,
        args: UserInfoRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'UserInfoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserInfoRouteArgs>(
        orElse: () => const UserInfoRouteArgs(),
      );
      return _i7.WrappedRoute(child: _i6.UserInfoScreen(key: args.key));
    },
  );
}

class UserInfoRouteArgs {
  const UserInfoRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'UserInfoRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserInfoRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
