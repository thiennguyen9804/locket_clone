// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UploadPost {
  final String imagePath;
  final String caption;

  UploadPost({
    required this.imagePath,
    required this.caption,
  });

  UploadPost copyWith({
    String? imagePath,
    String? caption,
  }) {
    return UploadPost(
      imagePath: imagePath ?? this.imagePath,
      caption: caption ?? this.caption,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'caption': caption,
    };
  }

  factory UploadPost.fromMap(Map<String, dynamic> map) {
    return UploadPost(
      imagePath: map['imagePath'] as String,
      caption: map['caption'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadPost.fromJson(String source) => UploadPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UploadPost(imagePath: $imagePath, caption: $caption)';

  @override
  bool operator ==(covariant UploadPost other) {
    if (identical(this, other)) return true;
  
    return 
      other.imagePath == imagePath &&
      other.caption == caption;
  }

  @override
  int get hashCode => imagePath.hashCode ^ caption.hashCode;
}
