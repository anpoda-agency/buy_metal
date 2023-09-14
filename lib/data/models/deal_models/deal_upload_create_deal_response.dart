// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'deal_upload_create_deal_response.g.dart';

@JsonSerializable()
class DealUploadCreateDealResponse {
  @JsonKey(name: 'agreementDate', fromJson: FromJsonBase.jsonToString)
  final String agreementDate;
  @JsonKey(name: 'application')
  final Application application;
  @JsonKey(name: 'canceledByCustomer', fromJson: FromJsonBase.jsonToBool)
  final bool canceledByCustomer;
  @JsonKey(name: 'creationTime', fromJson: FromJsonBase.jsonToString)
  final String creationTime;
  @JsonKey(name: 'customerId', fromJson: FromJsonBase.jsonToString)
  final String customerId;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'response')
  final Response response;
  @JsonKey(name: 'status', fromJson: FromJsonBase.jsonToString)
  final String status;
  @JsonKey(name: 'supplierId', fromJson: FromJsonBase.jsonToString)
  final String supplierId;
  @JsonKey(name: 'updateDate', fromJson: FromJsonBase.jsonToString)
  final String updateDate;

  const DealUploadCreateDealResponse({
    this.agreementDate = '',
    this.application = const Application(),
    this.canceledByCustomer = false,
    this.creationTime = '',
    this.customerId = '',
    this.id = '',
    this.response = const Response(),
    this.status = '',
    this.supplierId = '',
    this.updateDate = '',
  });

  factory DealUploadCreateDealResponse.fromJson(Map<String, dynamic> json) =>
      _$DealUploadCreateDealResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DealUploadCreateDealResponseToJson(this);

  DealUploadCreateDealResponse copyWith({
    String? agreementDate,
    Application? application,
    bool? canceledByCustomer,
    String? creationTime,
    String? customerId,
    String? id,
    Response? response,
    String? status,
    String? supplierId,
    String? updateDate,
  }) {
    return DealUploadCreateDealResponse(
      agreementDate: agreementDate ?? this.agreementDate,
      application: application ?? this.application,
      canceledByCustomer: canceledByCustomer ?? this.canceledByCustomer,
      creationTime: creationTime ?? this.creationTime,
      customerId: customerId ?? this.customerId,
      id: id ?? this.id,
      response: response ?? this.response,
      status: status ?? this.status,
      supplierId: supplierId ?? this.supplierId,
      updateDate: updateDate ?? this.updateDate,
    );
  }
}

@JsonSerializable()
class Application {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToDouble)
  final double amount;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'customer')
  final Customer customer;

  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'inStock', fromJson: FromJsonBase.jsonToBool)
  final bool inStock;
  @JsonKey(name: 'materialBrand', fromJson: FromJsonBase.jsonToString)
  final String materialBrand;
  @JsonKey(name: 'materialGost', fromJson: FromJsonBase.jsonToString)
  final String materialGost;
  @JsonKey(name: 'materialParams', fromJson: FromJsonBase.jsonToString)
  final String materialParams;

  @JsonKey(name: 'rolledForm', fromJson: FromJsonBase.jsonToString)
  final String rolledForm;
  @JsonKey(name: 'rolledGost', fromJson: FromJsonBase.jsonToString)
  final String rolledGost;
  @JsonKey(name: 'rolledParams', fromJson: FromJsonBase.jsonToString)
  final String rolledParams;
  @JsonKey(name: 'rolledSize', fromJson: FromJsonBase.jsonToString)
  final String rolledSize;
  @JsonKey(name: 'rolledType', fromJson: FromJsonBase.jsonToString)
  final String rolledType;
  @JsonKey(name: 'status', fromJson: FromJsonBase.jsonToString)
  final String status;

  const Application({
    this.amount = 0,
    this.creationDate = '',
    this.customer = const Customer(),
    this.id = '',
    this.inStock = false,
    this.materialBrand = '',
    this.materialGost = '',
    this.materialParams = '',
    this.rolledForm = '',
    this.rolledGost = '',
    this.rolledParams = '',
    this.rolledSize = '',
    this.rolledType = '',
    this.status = '',
  });

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  Application copyWith({
    double? amount,
    String? creationDate,
    Customer? customer,
    String? id,
    bool? inStock,
    String? materialBrand,
    String? materialGost,
    String? materialParams,
    String? rolledForm,
    String? rolledGost,
    String? rolledParams,
    String? rolledSize,
    String? rolledType,
    String? status,
  }) {
    return Application(
      amount: amount ?? this.amount,
      creationDate: creationDate ?? this.creationDate,
      customer: customer ?? this.customer,
      id: id ?? this.id,
      inStock: inStock ?? this.inStock,
      materialBrand: materialBrand ?? this.materialBrand,
      materialGost: materialGost ?? this.materialGost,
      materialParams: materialParams ?? this.materialParams,
      rolledForm: rolledForm ?? this.rolledForm,
      rolledGost: rolledGost ?? this.rolledGost,
      rolledParams: rolledParams ?? this.rolledParams,
      rolledSize: rolledSize ?? this.rolledSize,
      rolledType: rolledType ?? this.rolledType,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class Customer {
  @JsonKey(name: 'blocked', fromJson: FromJsonBase.jsonToBool)
  final bool blocked;
  @JsonKey(name: 'companyAddress', fromJson: FromJsonBase.jsonToString)
  final String companyAddress;
  @JsonKey(name: 'companyName', fromJson: FromJsonBase.jsonToString)
  final String companyName;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'fullName', fromJson: FromJsonBase.jsonToString)
  final String fullName;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'mailConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool mailConfirmed;
  @JsonKey(name: 'phone', fromJson: FromJsonBase.jsonToString)
  final String phone;
  @JsonKey(name: 'position', fromJson: FromJsonBase.jsonToString)
  final String position;
  @JsonKey(name: 'refresh', fromJson: FromJsonBase.jsonToString)
  final String refresh;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'tin', fromJson: FromJsonBase.jsonToString)
  final String tin;

  const Customer({
    this.blocked = false,
    this.companyAddress = '',
    this.companyName = '',
    this.email = '',
    this.fullName = '',
    this.id = '',
    this.mailConfirmed = false,
    this.phone = '',
    this.position = '',
    this.refresh = '',
    this.registrationDate = '',
    this.tin = '',
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  Customer copyWith({
    bool? blocked,
    String? companyAddress,
    String? companyName,
    String? email,
    String? fullName,
    String? id,
    bool? mailConfirmed,
    String? phone,
    String? position,
    String? refresh,
    String? registrationDate,
    String? tin,
  }) {
    return Customer(
      blocked: blocked ?? this.blocked,
      companyAddress: companyAddress ?? this.companyAddress,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      mailConfirmed: mailConfirmed ?? this.mailConfirmed,
      phone: phone ?? this.phone,
      position: position ?? this.position,
      refresh: refresh ?? this.refresh,
      registrationDate: registrationDate ?? this.registrationDate,
      tin: tin ?? this.tin,
    );
  }
}

@JsonSerializable()
class Response {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToDouble)
  final double amount;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'deliverDate', fromJson: FromJsonBase.jsonToString)
  final String deliverDate;
  @JsonKey(name: 'fullPrice', fromJson: FromJsonBase.jsonToDouble)
  final double fullPrice;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'inStock', fromJson: FromJsonBase.jsonToBool)
  final bool inStock;
  @JsonKey(name: 'materialBrand', fromJson: FromJsonBase.jsonToString)
  final String materialBrand;
  @JsonKey(name: 'materialGost', fromJson: FromJsonBase.jsonToString)
  final String materialGost;
  @JsonKey(name: 'materialParams', fromJson: FromJsonBase.jsonToString)
  final String materialParams;
  @JsonKey(name: 'price', fromJson: FromJsonBase.jsonToDouble)
  final double price;
  @JsonKey(name: 'rolledForm', fromJson: FromJsonBase.jsonToString)
  final String rolledForm;
  @JsonKey(name: 'rolledGost', fromJson: FromJsonBase.jsonToString)
  final String rolledGost;
  @JsonKey(name: 'rolledParams', fromJson: FromJsonBase.jsonToString)
  final String rolledParams;
  @JsonKey(name: 'rolledSize', fromJson: FromJsonBase.jsonToString)
  final String rolledSize;
  @JsonKey(name: 'rolledType', fromJson: FromJsonBase.jsonToString)
  final String rolledType;
  @JsonKey(name: 'similar', fromJson: FromJsonBase.jsonToBool)
  final bool similar;

  const Response({
    this.amount = 0,
    this.creationDate = '',
    this.deliverDate = '',
    this.fullPrice = 0,
    this.id = '',
    this.inStock = false,
    this.materialBrand = '',
    this.materialGost = '',
    this.materialParams = '',
    this.price = 0,
    this.rolledForm = '',
    this.rolledGost = '',
    this.rolledParams = '',
    this.rolledSize = '',
    this.rolledType = '',
    this.similar = false,
  });

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  Response copyWith({
    double? amount,
    String? creationDate,
    String? deliverDate,
    double? fullPrice,
    String? id,
    bool? inStock,
    String? materialBrand,
    String? materialGost,
    String? materialParams,
    double? price,
    String? rolledForm,
    String? rolledGost,
    String? rolledParams,
    String? rolledSize,
    String? rolledType,
    bool? similar,
  }) {
    return Response(
      amount: amount ?? this.amount,
      creationDate: creationDate ?? this.creationDate,
      deliverDate: deliverDate ?? this.deliverDate,
      fullPrice: fullPrice ?? this.fullPrice,
      id: id ?? this.id,
      inStock: inStock ?? this.inStock,
      materialBrand: materialBrand ?? this.materialBrand,
      materialGost: materialGost ?? this.materialGost,
      materialParams: materialParams ?? this.materialParams,
      price: price ?? this.price,
      rolledForm: rolledForm ?? this.rolledForm,
      rolledGost: rolledGost ?? this.rolledGost,
      rolledParams: rolledParams ?? this.rolledParams,
      rolledSize: rolledSize ?? this.rolledSize,
      rolledType: rolledType ?? this.rolledType,
      similar: similar ?? this.similar,
    );
  }
}
