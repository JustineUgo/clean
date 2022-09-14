import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/modules/timeline/data/repositories/timeline_repositories_impl.dart';
import 'package:clean/app/modules/timeline/domain/entities/comment_entity.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_comment.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_post_test.dart';

class MockTimelineRepository extends Mock implements TimelineRepositoryImpl {}

void main() {
  late MockTimelineRepository mockTimelineRepository;
  late GetComment getComment;

  setUp(() {
    mockTimelineRepository = MockTimelineRepository();
    getComment = GetComment(timelineRepository: mockTimelineRepository);
  });

  group('Get Comment usecase', () {
    int postId = 1;
    Failure failure = Failure(code: 400);
    List<Comment> comments = [
      Comment(id: 1, postId: 1, name: 'name', email: ' email', body: 'body')
    ];

    test('should return Comment', () async {
      //Arrange
      when(
        () => mockTimelineRepository.getComments(
          any(),
        ),
      ).thenAnswer(
        (_) async => Right(comments),
      );

      //Act
      final result = await getComment(Params(postId: postId));

      //Assert
      verify(() => mockTimelineRepository.getComments(postId)).called(1);
      verifyNoMoreInteractions(mockTimelineRepository);
      expect(result, Right(comments));
    });

    test('should return error', () async {
      //Arrange
      when(
        () => mockTimelineRepository.getComments(
          any(),
        ),
      ).thenAnswer(
        (_) async => Left(failure),
      );

      //Act
      final result = await getComment(Params(postId: postId));
      //Assert
      verify(
        () => mockTimelineRepository.getComments(postId),
      );
      verifyNoMoreInteractions(
        mockTimelineRepository,
      );
      expect(
        result,
        Left(failure),
      );
    });
  });
}
