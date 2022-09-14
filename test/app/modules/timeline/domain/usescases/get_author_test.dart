import 'package:clean/app/modules/timeline/domain/entities/author_entity.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_author.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTimelineRepository extends Mock implements TimelineRepository {}

void main() {
  late GetAuthor getAuthor;
  late MockTimelineRepository mockTimelineRepository;

  setUp(() {
    mockTimelineRepository = MockTimelineRepository();
    getAuthor = GetAuthor(timelineRepository: mockTimelineRepository);
  });

  group('Get Author usecase', () {
    Author author = Author(
        id: 1, name: 'name', email: 'email', gender: 'gender', status: 'status');
    test('Should return an Author', () {
      //Arrange
      when(
        () => mockTimelineRepository.getAuthor(any()),
      ).thenAnswer((_) async => Right(author));
      //Act
      //Assert
    });
  });
}
