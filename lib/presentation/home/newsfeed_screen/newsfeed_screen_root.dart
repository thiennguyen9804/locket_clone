import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';

class NewsfeedScreenRoot extends InheritedWidget {
  const NewsfeedScreenRoot({
    super.key,
    required this.child,
    required this.commentController,
    required this.commentHandler,
    required this.emojiSelectedHandler,
    required this.onPostChanged,
  }) : super(child: child);
  final Widget child;
  final TextEditingController commentController;
  final VoidCallback commentHandler;

  final Function(Emoji) emojiSelectedHandler;
  final void Function(PostEntity post) onPostChanged;

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
