// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_response_upload_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationResponseUploadCreateRequest
    _$ApplicationResponseUploadCreateRequestFromJson(
            Map<String, dynamic> json) =>
        ApplicationResponseUploadCreateRequest(
          amount: json['amount'] == null
              ? 0
              : FromJsonBase.jsonToInt(json['amount']),
          applicationId: json['applicationId'] == null
              ? ''
              : FromJsonBase.jsonToString(json['applicationId']),
          creationDate: json['creationDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['creationDate']),
          deliverDate: json['deliverDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['deliverDate']),
          fullPrice: json['fullPrice'] == null
              ? 0
              : FromJsonBase.jsonToDouble(json['fullPrice']),
          inStock: json['inStock'] == null
              ? false
              : FromJsonBase.jsonToBool(json['inStock']),
          materialBrand: json['materialBrand'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialBrand']),
          materialGost: json['materialGost'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialGost']),
          materialParams: json['materialParams'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialParams']),
          price: json['price'] == null
              ? 0
              : FromJsonBase.jsonToDouble(json['price']),
          rolledForm: json['rolledForm'] == null
              ? ''
              : FromJsonBase.jsonToString(json['rolledForm']),
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
          similar: json['similar'] == null
              ? false
              : FromJsonBase.jsonToBool(json['similar']),
          userID: json['userID'] == null
              ? ''
              : FromJsonBase.jsonToString(json['userID']),
        );

Map<String, dynamic> _$ApplicationResponseUploadCreateRequestToJson(
        ApplicationResponseUploadCreateRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'applicationId': instance.applicationId,
      'creationDate': instance.creationDate,
      'deliverDate': instance.deliverDate,
      'fullPrice': instance.fullPrice,
      'inStock': instance.inStock,
      'materialBrand': instance.materialBrand,
      'materialGost': instance.materialGost,
      'materialParams': instance.materialParams,
      'price': instance.price,
      'rolledForm': instance.rolledForm,
      'rolledGost': instance.rolledGost,
      'rolledParams': instance.rolledParams,
      'rolledSize': instance.rolledSize,
      'rolledType': instance.rolledType,
      'similar': instance.similar,
      'userID': instance.userID,
    };
