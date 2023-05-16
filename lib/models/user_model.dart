class UserModel {
  final String id;
  final String login;
  final String password;
  final String companyName;
  final bool isSupplier;
  final bool isBuyer;
  final String companyAderss;
  final String email;
  final String phone;
  final String managerName;

  const UserModel({
    this.id = '',
    this.login = '',
    this.password = '',
    this.companyName = '',
    this.isSupplier = false,
    this.isBuyer = false,
    this.companyAderss = '',
    this.email = '',
    this.phone = '',
    this.managerName = '',
  });

  UserModel copyWith({
    String? id,
    String? login,
    String? password,
    String? companyName,
    bool? isSupplier,
    bool? isBuyer,
    String? companyAderss,
    String? email,
    String? phone,
    String? managerName,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      isSupplier: isSupplier ?? this.isSupplier,
      isBuyer: isBuyer ?? this.isBuyer,
      companyAderss: companyAderss ?? this.companyAderss,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      managerName: managerName ?? this.managerName,
    );
  }
}
