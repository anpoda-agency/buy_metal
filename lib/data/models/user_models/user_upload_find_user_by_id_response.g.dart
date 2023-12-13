// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_upload_find_user_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadFindUserByIdResponse _$UserUploadFindUserByIdResponseFromJson(
        Map<String, dynamic> json) =>
    UserUploadFindUserByIdResponse(
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
      phoneConfirmed: json['phoneConfirmed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['phoneConfirmed']),
      position: json['position'] == null
          ? ''
          : FromJsonBase.jsonToString(json['position']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      tin: json['tin'] == null ? '' : FromJsonBase.jsonToString(json['tin']),
    );

Map<String, dynamic> _$UserUploadFindUserByIdResponseToJson(
        UserUploadFindUserByIdResponse instance) =>
    <String, dynamic>{
      'blocked': instance.blocked,
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'email': instance.email,
      'fullName': instance.fullName,
      'id': instance.id,
      'mailConfirmed': instance.mailConfirmed,
      'phone': instance.phone,
      'phoneConfirmed': instance.phoneConfirmed,
      'position': instance.position,
      'registrationDate': instance.registrationDate,
      'tin': instance.tin,
    };
