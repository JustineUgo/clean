import 'package:clean/app/modules/timeline/data/models/comment_model.dart';
import 'package:clean/app/modules/timeline/domain/entities/comment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CommentModel commentModel;

  setUp(() {
    commentModel = CommentModel(
      id: 2,
      postId: 2,
      name: 'name',
      email: 'email',
      body: 'body',
    );
  });

  group('Comment Model', () {
    Map<String, dynamic> json =  {
      'id': 2,
      'post_id': 2,
      'name': 'name',
      'email': 'email',
      'body': 'body',
    };
    test('should be a subclass of Coment', () {
      expect(commentModel, isA<Comment>());
    });

    test('should return Comment when comment json is passed.', () {
      //Arrange

      //Act
      final result = CommentModel.fromJson(json);
      //Assert
      expect(result, commentModel);
    });

    test('should return comment json object from CommentModel', () {
      //Arrange

      //Act
      final result = commentModel.toJson();

      //Assert
      expect(result, json);
    });
  });
}
