import 'package:clean/app/modules/timeline/domain/entities/entities.dart';

class PostModel extends Post {
  PostModel({
    required int id,
    required int user_id,
    required String title,
    required String body,
  }) : super(id: id, user_id: user_id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        user_id: json['user_id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'title': title,
      'body': body
    };
  }
}
