// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_upload_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUploadLoginRequest _$AuthUploadLoginRequestFromJson(
        Map<String, dynamic> json) =>
    AuthUploadLoginRequest(
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      password: json['password'] == null
          ? ''
          : FromJsonBase.jsonToString(json['password']),
    );

Map<String, dynamic> _$AuthUploadLoginRequestToJson(
        AuthUploadLoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
