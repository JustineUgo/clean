import 'package:clean/app/modules/timeline/data/models/models.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PostModel postModel;

  setUp(() {
    postModel = PostModel(
      id: 2,
      userId: 2,
      title: 'title',
      body: 'body',
    );
  });

  group('Post Model', () {
    Map<String, dynamic> json = {
      'id': 2,
      'user_id': 2,
      'title': 'title',
      'body': 'body',
    };
    test('should be a subclass of Post', () {
      expect(postModel, isA<Post>());
    });

    test('should return Post when post json is passed.', () {
      //Arrange

      //Act
      final result = PostModel.fromJson(json);
      //Assert
      expect(result, postModel);
    });

    test('should return json object from PostModel', () {
      //Arrange

      //Act
      final result = postModel.toJson();

      //Assert
      expect(result, json);
    });
  });
}
