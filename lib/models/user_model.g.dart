// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String? ?? '',
      login: json['login'] as String? ?? '',
      password: json['password'] as String? ?? '',
      companyName: json['company_name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      companyAdress: json['company_adress'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      userFIO: json['user_fio'] as String? ?? '',
      inn: json['inn'] as String? ?? '',
      post: json['post'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'company_name': instance.companyName,
      'type': instance.type,
      'company_adress': instance.companyAdress,
      'email': instance.email,
      'phone': instance.phone,
      'user_fio': instance.userFIO,
      'inn': instance.inn,
      'post': instance.post,
    };
