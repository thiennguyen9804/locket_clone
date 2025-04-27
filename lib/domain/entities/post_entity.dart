// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:locket_clone/domain/entities/user_entity.dart';

class PostEntity {
  final int id;
  final String imageUrl;
  final UserEntity user;
  final String caption;
  final dynamic interactionList;
  final DateTime createdAt;

  PostEntity({
    required this.id,
    required this.imageUrl,
    required this.user,
    required this.caption,
    required this.interactionList,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'PostEntity(id: $id, imageUrl: $imageUrl, user: $user, caption: $caption, interactionList: $interactionList, createdAt: $createdAt)';
  }
}
