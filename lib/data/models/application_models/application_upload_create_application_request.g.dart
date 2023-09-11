// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_upload_create_application_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationUploadCreateApplicationRequest
    _$ApplicationUploadCreateApplicationRequestFromJson(
            Map<String, dynamic> json) =>
        ApplicationUploadCreateApplicationRequest(
          amount: json['amount'] == null
              ? 0
              : FromJsonBase.jsonToInt(json['amount']),
          creationDate: json['creationDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['creationDate']),
          materialBrand: json['materialBrand'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialBrand']),
          materialGost: json['materialGost'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialGost']),
          materialParams: json['materialParams'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialParams']),
          rolledForm:
              $enumDecodeNullable(_$TypeListEnumEnumMap, json['rolledForm']),
          rolledGost: json['rolledGost'] == null
              ? ''
              : FromJsonBase.jsonToString(json['rolledGost']),
          rolledParams: json['rolledParams'] == null
              ? ''
              : FromJsonBase.jsonToString(json['rolledParams']),
          rolledSize: json['rolledSize'] == null
              ? ''
              : FromJsonBase.jsonToString(json['rolledSize']),
          rolledType: json['rolledType'] == null
              ? ''
              : FromJsonBase.jsonToString(json['rolledType']),
          userId: json['userId'] == null
              ? ''
              : FromJsonBase.jsonToString(json['userId']),
        );

Map<String, dynamic> _$ApplicationUploadCreateApplicationRequestToJson(
        ApplicationUploadCreateApplicationRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'creationDate': instance.creationDate,
      'materialBrand': instance.materialBrand,
      'materialGost': instance.materialGost,
      'materialParams': instance.materialParams,
      'rolledForm': _$TypeListEnumEnumMap[instance.rolledForm],
      'rolledGost': instance.rolledGost,
      'rolledParams': instance.rolledParams,
      'rolledSize': instance.rolledSize,
      'rolledType': instance.rolledType,
      'userId': instance.userId,
    };

const _$TypeListEnumEnumMap = {
  TypeListEnum.STRIP: 'STRIP',
  TypeListEnum.CIRCLE: 'CIRCLE',
  TypeListEnum.SQUARE: 'SQUARE',
  TypeListEnum.WIRE: 'WIRE',
  TypeListEnum.HEXAGON: 'HEXAGON',
  TypeListEnum.CHANNEL: 'CHANNEL',
  TypeListEnum.I_BEAM: 'I_BEAM',
  TypeListEnum.CORNER: 'CORNER',
  TypeListEnum.PIPE: 'PIPE',
  TypeListEnum.SHEET: 'SHEET',
  TypeListEnum.ARMATURE: 'ARMATURE',
};
