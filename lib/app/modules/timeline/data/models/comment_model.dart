import 'package:clean/app/modules/timeline/domain/entities/comment_entity.dart';

class CommentModel extends Comment {
  CommentModel({
    required String id,
    required String post_id,
    required String name,
    required String email,
    required String body,
  }) : super(id: id, post_id: post_id, name: name, email: email, body: body);

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        id: json['id'],
        post_id: json['post_id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post_id': post_id,
      'name': name,
      'email': email,
      'body': body
    };
  }
}
