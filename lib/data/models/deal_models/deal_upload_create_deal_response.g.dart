// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_upload_create_deal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealUploadCreateDealResponse _$DealUploadCreateDealResponseFromJson(
        Map<String, dynamic> json) =>
    DealUploadCreateDealResponse(
      agreementDate: json['agreementDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['agreementDate']),
      application: json['application'] == null
          ? const Application()
          : Application.fromJson(json['application'] as Map<String, dynamic>),
      canceledByCustomer: json['canceledByCustomer'] == null
          ? false
          : FromJsonBase.jsonToBool(json['canceledByCustomer']),
      creationTime: json['creationTime'] == null
          ? ''
          : FromJsonBase.jsonToString(json['creationTime']),
      customerId: json['customerId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['customerId']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      response: json['response'] == null
          ? const Response()
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      status: json['status'] == null
          ? ''
          : FromJsonBase.jsonToString(json['status']),
      supplierId: json['supplierId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['supplierId']),
      updateDate: json['updateDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['updateDate']),
    );

Map<String, dynamic> _$DealUploadCreateDealResponseToJson(
        DealUploadCreateDealResponse instance) =>
    <String, dynamic>{
      'agreementDate': instance.agreementDate,
      'application': instance.application,
      'canceledByCustomer': instance.canceledByCustomer,
      'creationTime': instance.creationTime,
      'customerId': instance.customerId,
      'id': instance.id,
      'response': instance.response,
      'status': instance.status,
      'supplierId': instance.supplierId,
      'updateDate': instance.updateDate,
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
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

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'creationDate': instance.creationDate,
      'customer': instance.customer,
      'id': instance.id,
      'inStock': instance.inStock,
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

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      amount: json['amount'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['amount']),
      creationDate: json['creationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['creationDate']),
      deliverDate: json['deliverDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['deliverDate']),
      fullPrice: json['fullPrice'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['fullPrice']),
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
          json['price'] == null ? 0 : FromJsonBase.jsonToDouble(json['price']),
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
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
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
