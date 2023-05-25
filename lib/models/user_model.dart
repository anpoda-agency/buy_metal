import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'user_model.g.dart';

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
  @JsonKey(name: 'buyer')
  final bool buyer;
  @JsonKey(name: 'supplier')
  final bool supplier;

  const UserModel(
      {this.id = '',
      this.login = '',
      this.password = '',
      this.companyName = '',
      this.buyer = false,
      this.supplier = false,
      this.companyAdress = '',
      this.email = '',
      this.phone = '',
      this.userFIO = '',
      this.inn = '',
      this.post = ''});

  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     _$UserModelFromJson(json);
  // Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? login,
    String? password,
    String? companyName,
    String? companyAdress,
    String? email,
    String? phone,
    String? userFIO,
    String? inn,
    String? post,
    bool? buyer,
    bool? supplier,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      buyer: buyer ?? this.buyer,
      supplier: supplier ?? this.supplier,
      companyAdress: companyAdress ?? this.companyAdress,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userFIO: userFIO ?? this.userFIO,
      inn: inn ?? this.inn,
      post: post ?? this.post,
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      password: data?['password'],
      companyName: data?['company_name'],
      buyer: data?['buyer'],
      supplier: data?['supplier'],
      companyAdress: data?['company_adress'],
      email: data?['email'],
      phone: data?['phone'],
      userFIO: data?['user_fio'],
      inn: data?['inn'],
      post: data?['post'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (password != null) "password": password,
      if (companyName != null) "company_name": companyName,
      if (buyer != null) "buyer": buyer,
      if (supplier != null) "supplier": supplier,
      if (companyAdress != null) "company_adress": companyAdress,
      if (email != null) "email": email,
      if (phone != null) "phone": phone,
      if (userFIO != null) "user_fio": userFIO,
      if (inn != null) "inn": inn,
      if (post != null) "post": post,
    };
  }
}
