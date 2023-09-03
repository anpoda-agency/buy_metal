// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_upload_refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUploadRefreshTokenResponse _$AuthUploadRefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    AuthUploadRefreshTokenResponse(
      accessToken: json['accessToken'] == null
          ? ''
          : FromJsonBase.jsonToString(json['accessToken']),
      refreshToken: json['refreshToken'] == null
          ? ''
          : FromJsonBase.jsonToString(json['refreshToken']),
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthUploadRefreshTokenResponseToJson(
        AuthUploadRefreshTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      blocked: json['blocked'] == null
          ? false
          : FromJsonBase.jsonToBool(json['blocked']),
      companyAddress: json['companyAddress'] == null
          ? ''
          : FromJsonBase.jsonToString(json['companyAddress']),
      companyName: json['companyName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['companyName']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      fullName: json['fullName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['fullName']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      mailConfirmed: json['mailConfirmed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['mailConfirmed']),
      phone:
          json['phone'] == null ? '' : FromJsonBase.jsonToString(json['phone']),
      position: json['position'] == null
          ? ''
          : FromJsonBase.jsonToString(json['position']),
      refresh: json['refresh'] == null
          ? ''
          : FromJsonBase.jsonToString(json['refresh']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      tin: json['tin'] == null ? '' : FromJsonBase.jsonToString(json['tin']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'blocked': instance.blocked,
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'email': instance.email,
      'fullName': instance.fullName,
      'id': instance.id,
      'mailConfirmed': instance.mailConfirmed,
      'phone': instance.phone,
      'position': instance.position,
      'refresh': instance.refresh,
      'registrationDate': instance.registrationDate,
      'tin': instance.tin,
    };
