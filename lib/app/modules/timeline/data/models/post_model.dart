import 'package:clean/app/modules/timeline/domain/entities/entities.dart';

class PostModel extends Post {
  PostModel({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
        );
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      body: json['body'],
    );
  }
  // Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'body': body,
    };
    //   return {'id': id, 'user_id': userId, 'title': title, 'body': body};
  }
}
