// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_upload_update_order_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealUploadUpdateOrderStatusRequest _$DealUploadUpdateOrderStatusRequestFromJson(
        Map<String, dynamic> json) =>
    DealUploadUpdateOrderStatusRequest(
      initiatorId: json['initiatorId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['initiatorId']),
      targetStatus: json['targetStatus'] == null
          ? ''
          : FromJsonBase.jsonToString(json['targetStatus']),
    );

Map<String, dynamic> _$DealUploadUpdateOrderStatusRequestToJson(
        DealUploadUpdateOrderStatusRequest instance) =>
    <String, dynamic>{
      'initiatorId': instance.initiatorId,
      'targetStatus': instance.targetStatus,
    };
