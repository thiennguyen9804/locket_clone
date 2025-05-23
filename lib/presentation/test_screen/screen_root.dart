import 'package:flutter/widgets.dart';

class ScreenRoot extends InheritedWidget {
  final controller = TextEditingController();
  ScreenRoot({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
  
  static ScreenRoot? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScreenRoot>();
  }

  static ScreenRoot of(BuildContext context) {
    final ScreenRoot? result = maybeOf(context);
    assert(result != null, 'No ScreenRoot found in context');
    return result!;
  }



}