import 'dart:developer';

import 'package:clean/app/core/request_header/header.dart';
import 'package:clean/app/modules/timeline/data/datasources/timeline_remote_datasource.dart';
import 'package:clean/app/modules/timeline/data/repositories/timeline_repositories_impl.dart';
import 'package:clean/app/modules/timeline/domain/repositories/timeline_repository.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_author.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_comment.dart';
import 'package:clean/app/modules/timeline/domain/usescases/get_post.dart';
import 'package:clean/app/modules/timeline/presentation/controllers/timeline_controller.dart';
import 'package:clean/app/modules/todo/controllers/todo_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    log('INITITIALING DEPENDENCIES');

    //! inject controllers dependencies [Usecases]
    Get.lazyPut<TimelineController>(
      () => TimelineController(
        getPost: Get.find<GetPost>(),
      ),
    );
    Get.lazyPut<TodoController>(
      () => TodoController(),
    );

    //! inject usecases dependencies [Repository]
    // TimelineRepository timelineRepository = Get.find<TimelineRepository>();
    Get.lazyPut<GetPost>(
      () => GetPost(
        timelineRepository: Get.find<TimelineRepository>(),
      ),
    );
    Get.lazyPut<GetComment>(
      () => GetComment(
        timelineRepository: Get.find<TimelineRepository>(),
      ),
    );
    Get.lazyPut<GetAuthor>(
      () => GetAuthor(
        timelineRepository: Get.find<TimelineRepository>(),
      ),
    );

    //! inject repository dependencies [Repo Impl]
    Get.lazyPut<TimelineRepository>(
      () => Get.find<TimelineRepositoriesImpl>(),
    );

    //! inject repo impl dependencies [Datasources]
    Get.lazyPut<TimelineRepositoriesImpl>(
      () => TimelineRepositoriesImpl(
        remoteDatasource: Get.find<TimelineRemoteDatasource>(),
      ),
    );

    //! inject datasource dependencies [datasource impl]
    Get.lazyPut<TimelineRemoteDatasource>(
      () => TimelineRemoteDatasourceImpl(
        client: Get.find<GetHttpClient>(),
        headers: Get.find<RequestHeaders>(),
      ),
    );

    Get.lazyPut<RequestHeaders>(() => Get.find<HeaderImpl>());
    Get.lazyPut(() => HeaderImpl());
    Get.lazyPut(
      () => GetHttpClient(),
    );
  }
}
