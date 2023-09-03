// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_upload_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealUploadSearchRequest _$DealUploadSearchRequestFromJson(
        Map<String, dynamic> json) =>
    DealUploadSearchRequest(
      customerId: json['customerId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['customerId']),
      limit: json['limit'] == null ? 0 : FromJsonBase.jsonToInt(json['limit']),
      offset:
          json['offset'] == null ? 0 : FromJsonBase.jsonToInt(json['offset']),
      statuses: json['statuses'] == null
          ? const <String>[]
          : FromJsonBase.jsonToListString(json['statuses']),
      supplierId: json['supplierId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['supplierId']),
    );

Map<String, dynamic> _$DealUploadSearchRequestToJson(
        DealUploadSearchRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'limit': instance.limit,
      'offset': instance.offset,
      'statuses': instance.statuses,
      'supplierId': instance.supplierId,
    };
