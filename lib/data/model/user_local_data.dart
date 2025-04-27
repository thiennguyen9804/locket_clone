// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLocalData {
  final int id;
  final String name;
  String? avatarUrl;
  final String email;
  final String phoneNumber;

  UserLocalData({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.email,
    required this.phoneNumber,
  });

  UserLocalData copyWith({
    int? id,
    String? name,
    String? avatarUrl,
    String? email,
    String? phoneNumber,
  }) {
    return UserLocalData(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserLocalData.fromMap(Map<String, dynamic> map) {
    return UserLocalData(
      id: map['id'] as int,
      name: map['name'] as String,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocalData.fromJson(String source) => UserLocalData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserLocalData(id: $id, name: $name, avatarUrl: $avatarUrl, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserLocalData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.avatarUrl == avatarUrl &&
      other.email == email &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      avatarUrl.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode;
  }
}
