import 'package:clean/app/core/errors/exceptions.dart';
import 'package:clean/app/core/request_header/header.dart';
import 'package:clean/app/core/utils/constants/constants.dart';
import 'package:clean/app/core/utils/urls/urls.dart';
import 'package:clean/app/modules/timeline/data/models/models.dart';
import 'package:clean/app/modules/timeline/domain/entities/entities.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class TimelineRemoteDatasource {
  Future<List<PostModel>> getPosts(int pageIndex);
  Future<List<CommentModel>> getComments(int postId);
  Future<AuthorModel> getAuthor(int userId);
}

class TimelineRemoteDatasourceImpl implements TimelineRemoteDatasource {
  final GetHttpClient client;
  final RequestHeaders headers;
  TimelineRemoteDatasourceImpl({required this.client, required this.headers}) {
    client.baseUrl = dotenv.env[Constants.kBASEURL];
  }

  @override
  Future<AuthorModel> getAuthor(int userId) {
    // TODO: implement getAuthor
    throw UnimplementedError();
  }

  @override
  Future<List<CommentModel>> getComments(int postId) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts(int pageIndex) async {
    Response response = await client.get(Urls.posts, headers: headers());

    if (response.hasError) {
      throw ServerException(errorCode: response.statusCode ?? 0);
    }

    List<dynamic> posts = response.body;
    return posts.map((post) => PostModel.fromJson(post)).toList();
  }
}
