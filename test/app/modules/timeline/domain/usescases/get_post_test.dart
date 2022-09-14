import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_post.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:mockito/mockito.dart';

class MockTimelineRepository extends Mock implements TimelineRepository {}

void main() {
  late GetPost getPostUsecase;
  late MockTimelineRepository mockTimelineRepository;

  setUp(() {
    mockTimelineRepository = MockTimelineRepository();
    getPostUsecase = GetPost(timelineRepository: mockTimelineRepository);
  });

  group('Get Post usecase', () {
    int pageIndex = 1;
    List<Post> posts = [Post(id: 1, user_id: 1, title: 'title', body: 'body')];
    Failure failure = Failure(code: 400);

    test('should get list of posts for a page index', () async {
      //arrange
      when(() => mockTimelineRepository.getPosts(any()))
          .thenAnswer((_) async => Right(posts));

      //act
      final result = await getPostUsecase(Params(pageIndex: pageIndex));

      //assert
      verify(() => mockTimelineRepository.getPosts(pageIndex)).called(1);
      expect(result, Right(posts));
    });

    test('should return failure when repo fails', () async {
      //arrange
      when(() => mockTimelineRepository.getPosts(any())).thenAnswer(
        (_) async => Left(failure),
      );

      //act
      final result = await getPostUsecase(Params(pageIndex: pageIndex));
      //asset
      verify(() => mockTimelineRepository.getPosts(pageIndex)).called(1);
      expect(result, Left(failure));
    });
  });
}
