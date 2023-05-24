import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'company_adress')
  final String companyAdress;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'user_fio')
  final String userFIO;
  @JsonKey(name: 'inn')
  final String inn;
  @JsonKey(name: 'post')
  final String post;

  const UserModel(
      {this.id = '',
      this.login = '',
      this.password = '',
      this.companyName = '',
      this.type = '',
      this.companyAdress = '',
      this.email = '',
      this.phone = '',
      this.userFIO = '',
      this.inn = '',
      this.post = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? login,
    String? password,
    String? companyName,
    String? type,
    String? companyAdress,
    String? email,
    String? phone,
    String? userFIO,
    String? inn,
    String? post,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      type: type ?? this.type,
      companyAdress: companyAdress ?? this.companyAdress,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userFIO: userFIO ?? this.userFIO,
      inn: inn ?? this.inn,
      post: post ?? this.post,
    );
  }
}
