class UserModel {
  final String id;

  const UserModel({
    this.id = '',
  });

  UserModel copyWith({
    String? id,
  }) {
    return UserModel(
      id: id ?? this.id,
    );
  }
}
