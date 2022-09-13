import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class TimelineRepository {
  Future<Either<Failure, List<Post>>> getPosts(int pageIndex);
  Future<Either<Failure, List<Comment>>> getComments(int postId);
  Future<Either<Failure, Author>> getAuthor(int userId);
}