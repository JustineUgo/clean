import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/core/usecase/usecase.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:dartz/dartz.dart';

class GetAuthor implements Usecase<Author, Params> {
  final TimelineRepository timelineRepository;
  GetAuthor({
    required this.timelineRepository,
  });

  @override
  Future<Either<Failure, Author>> call(params) async {
    return await timelineRepository.getAuthor(params.userId);
  }
}

class Params {
  final int userId;
  Params({required this.userId});
}
