// ignore_for_file: public_member_api_docs, sort_constructors_first
class Author {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String status;

  Author({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });


  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.gender == gender &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      status.hashCode;
  }

  @override
  String toString() {
    return 'Author(id: $id, name: $name, email: $email, gender: $gender, status: $status)';
  }
}
