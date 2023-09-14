// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_user_payments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGetUserPaymentsResponse _$UserGetUserPaymentsResponseFromJson(
        Map<String, dynamic> json) =>
    UserGetUserPaymentsResponse(
      amount: json['amount'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['amount']),
      customerId: json['customerId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['customerId']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      paymentDueDate: json['paymentDueDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['paymentDueDate']),
      relatedOrderId: json['relatedOrderId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['relatedOrderId']),
      status: json['status'] == null
          ? ''
          : FromJsonBase.jsonToString(json['status']),
    );

Map<String, dynamic> _$UserGetUserPaymentsResponseToJson(
        UserGetUserPaymentsResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'customerId': instance.customerId,
      'id': instance.id,
      'paymentDueDate': instance.paymentDueDate,
      'relatedOrderId': instance.relatedOrderId,
      'status': instance.status,
    };
