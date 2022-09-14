import 'dart:developer';

import 'package:clean/app/modules/timeline/domain/usescases/get_post.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  final GetPost getPost;
  TimelineController({
    required this.getPost,
  });

  Rx<int> postPageIndex = 0.obs;



  fetchPosts() async {
    final posts = await getPost(Params(pageIndex: postPageIndex.value));
    posts.fold(
      (failure) => log(failure.code.toString()),
      (post) => log(post.toString()),
    );
    Get.deleteAll();
  }
}
