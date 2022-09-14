// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  final String id;
  final String postId;
  final String name;
  final String email;
  final String body;
  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.postId == postId &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      postId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }

  @override
  String toString() {
    return 'Comment(id: $id, post_id: $postId, name: $name, email: $email, body: $body)';
  }
}
