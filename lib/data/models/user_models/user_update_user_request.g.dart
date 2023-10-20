// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateUserRequest _$UserUpdateUserRequestFromJson(
        Map<String, dynamic> json) =>
    UserUpdateUserRequest(
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
      phone:
          json['phone'] == null ? '' : FromJsonBase.jsonToString(json['phone']),
      tin: json['tin'] == null ? '' : FromJsonBase.jsonToString(json['tin']),
    );

Map<String, dynamic> _$UserUpdateUserRequestToJson(
        UserUpdateUserRequest instance) =>
    <String, dynamic>{
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'email': instance.email,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'tin': instance.tin,
    };
