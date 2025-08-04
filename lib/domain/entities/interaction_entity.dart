import 'package:locket_clone/domain/entities/user_entity.dart';

class InteractionEntity {
  final int id;
  final UserEntity user;
  final int postId;
  final String emoji;

  InteractionEntity({
    required this.id,
    required this.user,
    required this.postId,
    required this.emoji,
  });

  @override
  String toString() {
    return 'InteractionEntity(id: $id, user: $user, postId: $postId, emoji: $emoji,)';
  }
}
