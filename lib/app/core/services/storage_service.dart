import 'package:get_storage/get_storage.dart';

import '../../modules/timeline/domain/entities/entities.dart';

/// [Clean] storage system
abstract class StorageService {
  
  
  /// savePosts writes the list of posts to storage
  /// retrievePosts reads a list of posts from storage
  Future<bool> savePosts(Post post);
  Future<List<Post>> retrievePosts();

}

class StorageImpl implements StorageService {
  final GetStorage getStorage;

  StorageImpl({required this.getStorage});
  
  @override
  Future<List<Post>> retrievePosts() {
    // TODO: implement retrievePosts
    throw UnimplementedError();
  }
  
  @override
  Future<bool> savePosts(Post post) {
    // TODO: implement savePosts
    throw UnimplementedError();
  }
  
}
