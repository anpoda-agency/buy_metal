// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_upload_create_deal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealUploadCreateDealRequest _$DealUploadCreateDealRequestFromJson(
        Map<String, dynamic> json) =>
    DealUploadCreateDealRequest(
      applicationId: json['applicationId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['applicationId']),
      applicationResponseId: json['applicationResponseId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['applicationResponseId']),
    );

Map<String, dynamic> _$DealUploadCreateDealRequestToJson(
        DealUploadCreateDealRequest instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'applicationResponseId': instance.applicationResponseId,
    };
