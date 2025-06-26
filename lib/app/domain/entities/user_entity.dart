class UserEntity {
  final String uid;
  final String email;
  final String? image;
  final String? name;

  UserEntity({required this.uid, required this.email, this.image, this.name});
}
