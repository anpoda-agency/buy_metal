// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_upload_register_new_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUploadRegisterNewUserRequest _$AuthUploadRegisterNewUserRequestFromJson(
        Map<String, dynamic> json) =>
    AuthUploadRegisterNewUserRequest(
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
      password: json['password'] == null
          ? ''
          : FromJsonBase.jsonToString(json['password']),
      phone:
          json['phone'] == null ? '' : FromJsonBase.jsonToString(json['phone']),
      position: json['position'] == null
          ? ''
          : FromJsonBase.jsonToString(json['position']),
      tin: json['tin'] == null ? '' : FromJsonBase.jsonToString(json['tin']),
    );

Map<String, dynamic> _$AuthUploadRegisterNewUserRequestToJson(
        AuthUploadRegisterNewUserRequest instance) =>
    <String, dynamic>{
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'phone': instance.phone,
      'position': instance.position,
      'tin': instance.tin,
    };
