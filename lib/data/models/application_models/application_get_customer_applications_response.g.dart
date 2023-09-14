// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_get_customer_applications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationGetCustomerApplicationsResponse
    _$ApplicationGetCustomerApplicationsResponseFromJson(
            Map<String, dynamic> json) =>
        ApplicationGetCustomerApplicationsResponse(
          amount: json['amount'] == null
              ? 0
              : FromJsonBase.jsonToDouble(json['amount']),
          creationDate: json['creationDate'] == null
              ? ''
              : FromJsonBase.jsonToString(json['creationDate']),
          customer: json['customer'] == null
              ? const Customer()
              : Customer.fromJson(json['customer'] as Map<String, dynamic>),
          id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
          materialBrand: json['materialBrand'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialBrand']),
          materialGost: json['materialGost'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialGost']),
          materialParams: json['materialParams'] == null
              ? ''
              : FromJsonBase.jsonToString(json['materialParams']),
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
          status: json['status'] == null
              ? ''
              : FromJsonBase.jsonToString(json['status']),
        );

Map<String, dynamic> _$ApplicationGetCustomerApplicationsResponseToJson(
        ApplicationGetCustomerApplicationsResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'creationDate': instance.creationDate,
      'customer': instance.customer,
      'id': instance.id,
      'materialBrand': instance.materialBrand,
      'materialGost': instance.materialGost,
      'materialParams': instance.materialParams,
      'rolledForm': instance.rolledForm,
      'rolledGost': instance.rolledGost,
      'rolledParams': instance.rolledParams,
      'rolledSize': instance.rolledSize,
      'rolledType': instance.rolledType,
      'status': instance.status,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
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
      position: json['position'] == null
          ? ''
          : FromJsonBase.jsonToString(json['position']),
      refresh: json['refresh'] == null
          ? ''
          : FromJsonBase.jsonToString(json['refresh']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      tin: json['tin'] == null ? '' : FromJsonBase.jsonToString(json['tin']),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'blocked': instance.blocked,
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'email': instance.email,
      'fullName': instance.fullName,
      'id': instance.id,
      'mailConfirmed': instance.mailConfirmed,
      'phone': instance.phone,
      'position': instance.position,
      'refresh': instance.refresh,
      'registrationDate': instance.registrationDate,
      'tin': instance.tin,
    };
