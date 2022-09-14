
import 'package:dartz/dartz.dart';

import 'package:clean/app/core/errors/exceptions.dart';
import 'package:clean/app/core/errors/failures.dart';
import 'package:clean/app/modules/timeline/data/datasources/timeline_remote_datasource.dart';
import 'package:clean/app/modules/timeline/domain/entities/author_entity.dart';
import 'package:clean/app/modules/timeline/domain/entities/comment_entity.dart';
import 'package:clean/app/modules/timeline/domain/entities/post_entity.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';

class TimelineRepositoryImpl implements TimelineRepository {
  final TimelineRemoteDatasource remoteDatasource;
  TimelineRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, Author>> getAuthor(int userId) async {
    try {
      Author author = await remoteDatasource.getAuthor(userId);
      return Right(author);
    } on ServerException catch (e) {
      return Left(Failure(code: e.errorCode));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(int pageIndex) async {
    try {
      List<Post> posts = await remoteDatasource.getPosts(pageIndex);
      return Right(posts);
    } on ServerException catch (e) {
      return Left(Failure(code: e.errorCode));
    }
  }
}
