import 'package:clean/app/modules/timeline/domain/usescases/get_post.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  final GetPost getPost;
  TimelineController({
    required this.getPost,
  });

  late Rx<int> _postPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchPosts() async {
    final posts = await getPost(Params(pageIndex: _postPageIndex.value));
    posts.fold((failure) => print(failure.code), (post) => print(post),);
  }
}
