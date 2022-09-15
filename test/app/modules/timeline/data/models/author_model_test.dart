import 'package:clean/app/modules/timeline/data/models/author_model.dart';
import 'package:clean/app/modules/timeline/domain/entities/author_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthorModel authorModel;

  setUp(() {
    authorModel = AuthorModel(
      id: 3,
      name: 'name',
      email: 'email',
      gender: 'gender',
      status: 'status',
    );
  });
  group('Author Model', () {
    Map<String, dynamic> json = {
      'id': 3,
      'name': 'name',
      'email': 'email',
      'gender': 'gender',
      'status': 'status',
    };
    test('Author model is a child of Author', () {
      expect(
        authorModel,
        isA<Author>(),
      );
    });

    test('should return AuthorModel from author json', () {
      //Act
      final result = AuthorModel.fromJson(json);

      //Assert
      expect(result, authorModel);
    });

    test('should return author json object from AuthorModel', () {
      //Act
      final result = authorModel.toJson();

      //Assert
      expect(result, json);
    });
  });
}
