// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  final String id;
  final String post_id;
  final String name;
  final String email;
  final String body;
  Comment({
    required this.id,
    required this.post_id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.post_id == post_id &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      post_id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }

  @override
  String toString() {
    return 'Comment(id: $id, post_id: $post_id, name: $name, email: $email, body: $body)';
  }
}
