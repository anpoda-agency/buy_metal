// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_get_responses_by_application_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationGetResponsesByApplicationIdResponse
    _$ApplicationGetResponsesByApplicationIdResponseFromJson(
            Map<String, dynamic> json) =>
        ApplicationGetResponsesByApplicationIdResponse(
          amount: json['amount'] == null
              ? 0
              : FromJsonBase.jsonToInt(json['amount']),
          creationDate: json['creationDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['creationDate']),
          deliverDate: json['deliverDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['deliverDate']),
          fullPrice: json['fullPrice'] == null
              ? 0
              : FromJsonBase.jsonToInt(json['fullPrice']),
          id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
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
          price:
              json['price'] == null ? 0 : FromJsonBase.jsonToInt(json['price']),
          rolledForm: FromJsonBase.jsonToString(json['rolledForm']),
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
        );

Map<String, dynamic> _$ApplicationGetResponsesByApplicationIdResponseToJson(
        ApplicationGetResponsesByApplicationIdResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'creationDate': instance.creationDate,
      'deliverDate': instance.deliverDate,
      'fullPrice': instance.fullPrice,
      'id': instance.id,
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
    };
