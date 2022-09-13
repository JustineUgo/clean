// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final int id;
  final int user_id;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.user_id,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }

  @override
  String toString() {
    return 'Post(id: $id, user_id: $user_id, title: $title, body: $body)';
  }
}
