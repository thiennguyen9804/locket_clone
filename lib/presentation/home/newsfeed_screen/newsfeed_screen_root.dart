import 'package:flutter/widgets.dart';

class NewsfeedScreenRoot extends InheritedWidget {
  const NewsfeedScreenRoot({
    super.key,
    required this.child,
    required this.commentController,
    required this.commentHandler,
  }) : super(child: child);
  final Widget child;
  final TextEditingController commentController;
  final VoidCallback commentHandler;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static NewsfeedScreenRoot? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewsfeedScreenRoot>();
  }

  static NewsfeedScreenRoot of(BuildContext context) {
    final NewsfeedScreenRoot? result = maybeOf(context);
    assert(result != null, 'No NewsfeedScreenRoot found in context');
    return result!;
  }
}
