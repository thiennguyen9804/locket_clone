// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/model/user_dto/user_dto.dart';

class UserEntity {
  final int id;
  final String name;
  final String? avatarUrl;
  final String email;
  final String phoneNumber; // Thêm phoneNumber từ UserDto

  UserEntity({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.email,
    required this.phoneNumber,
  });



  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, avatarUrl: $avatarUrl, email: $email, phoneNumber: $phoneNumber)';
  }
}
