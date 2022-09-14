import 'package:clean/app/core/errors/failures.dart';
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
    int userId = 1;
    Author author = Author(
      id: 1,
      name: 'name',
      email: 'email',
      gender: 'gender',
      status: 'status',
    );
    Failure failure = Failure(code: 404);

    test('should return an Author', () async {
      //Arrange
      when(
        () => mockTimelineRepository.getAuthor(any()),
      ).thenAnswer((_) async => Right(author));

      //Act
      final result = await getAuthor(Params(userId: userId));

      //Assert
      verify(() => mockTimelineRepository.getAuthor(userId)).called(1);
      verifyNoMoreInteractions(mockTimelineRepository);
      expect(result, Right(author));
    });

    test('should return a failure', () async {
      //Arrange
      when(
        () => mockTimelineRepository.getAuthor(
          any(),
        ),
      ).thenAnswer(
        (_) async => Left(failure),
      );

      //Act
      final result = await getAuthor(Params(userId: userId));

      //assert
      verify(() => mockTimelineRepository.getAuthor(userId)).called(1);
      verifyNoMoreInteractions(mockTimelineRepository);
      expect(result, Left(failure));
    });
  });
}
