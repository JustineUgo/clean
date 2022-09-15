// import 'package:clean/app/modules/timeline/domain/entities/author_entity.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';

class AuthorModel extends Author {
  AuthorModel({
    required int id,
    required String name,
    required String email,
    required String gender,
    required String status,
  }) : super(id: id, name: name, email: email, gender: gender, status: status);

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'status': status,
    };
  }
}
