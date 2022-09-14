import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/core/usecase/usecase.dart';
import 'package:clean/app/modules/timeline/domain/entities/comment_entity.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:dartz/dartz.dart';

class GetComment implements Usecase<List<Comment>, Params> {
//implements Usecase<List<Comment>, Params>
// {
  final TimelineRepository timelineRepository;
  GetComment({
    required this.timelineRepository,
  });

  @override
  Future<Either<Failure, List<Comment>>> call(params) async {
    return await timelineRepository.getComments(params.postId);
  }

}

class Params {
  final int postId;
  Params({
    required this.postId,
  });
}