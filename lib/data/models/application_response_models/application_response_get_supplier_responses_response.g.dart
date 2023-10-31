// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_response_get_supplier_responses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationResponseGetSupplierResponsesResponse
    _$ApplicationResponseGetSupplierResponsesResponseFromJson(
            Map<String, dynamic> json) =>
        ApplicationResponseGetSupplierResponsesResponse(
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
          supplier: json['supplier'] == null
              ? const Supplier()
              : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApplicationResponseGetSupplierResponsesResponseToJson(
        ApplicationResponseGetSupplierResponsesResponse instance) =>
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
      'supplier': instance.supplier,
    };

Supplier _$SupplierFromJson(Map<String, dynamic> json) => Supplier(
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

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
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
