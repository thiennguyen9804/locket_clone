// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class PostLocalData {
  final int id;
  final String imageUrl;
  final int userId;
  final String caption;
  final dynamic interactionList;
  final DateTime createdAt;

  PostLocalData({
    required this.id,
    required this.imageUrl,
    required this.userId,
    required this.caption,
    required this.interactionList,
    required this.createdAt,
  });

  PostLocalData copyWith({
    int? id,
    String? imageUrl,
    int? userId,
    String? caption,
    dynamic? interactionList,
    DateTime? createdAt,
  }) {
    return PostLocalData(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      caption: caption ?? this.caption,
      interactionList: interactionList ?? this.interactionList,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'userId': userId,
      'caption': caption,
      'interactionList': interactionList,
      'createdAt': createdAt.toUtc().millisecondsSinceEpoch,
    };
  }

  factory PostLocalData.fromMap(Map<String, dynamic> map) {
    return PostLocalData(
      id: map['id'] as int,
      imageUrl: map['imageUrl'] as String,
      userId: map['userId'] as int,
      caption: map['caption'] as String,
      interactionList: map['interactionList'] as dynamic,
      createdAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['createdAt']), isUtc: true),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostLocalData.fromJson(String source) => PostLocalData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostLocalData(id: $id, imageUrl: $imageUrl, userId: $userId, caption: $caption, interactionList: $interactionList, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant PostLocalData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.imageUrl == imageUrl &&
      other.userId == userId &&
      other.caption == caption &&
      other.interactionList == interactionList &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      imageUrl.hashCode ^
      userId.hashCode ^
      caption.hashCode ^
      interactionList.hashCode ^
      createdAt.hashCode;
  }
}
