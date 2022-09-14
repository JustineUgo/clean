// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      body.hashCode;
  }

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, title: $title, body: $body)';
  }
}
