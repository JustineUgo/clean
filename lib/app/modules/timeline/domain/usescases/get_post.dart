import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/core/usecase/usecase.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:dartz/dartz.dart';

class GetPost implements Usecase<List<Post>, Params> {
  final TimelineRepository timelineRepository;
  GetPost({
    required this.timelineRepository,
  });

  @override
  Future<Either<Failure, List<Post>>> call(params) async {
    return await timelineRepository.getPosts(params.pageIndex);
  }
}

class Params {
  final int pageIndex;
  Params({
    required this.pageIndex,
  });
}
