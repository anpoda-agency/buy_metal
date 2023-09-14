// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_get_responses_by_application_id_response.g.dart';

@JsonSerializable()
class ApplicationGetResponsesByApplicationIdResponse {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToInt)
  final int amount;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'deliverDate', fromJson: FromJsonBase.jsonToString)
  final String deliverDate;
  @JsonKey(name: 'fullPrice', fromJson: FromJsonBase.jsonToInt)
  final int fullPrice;
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
  @JsonKey(name: 'price', fromJson: FromJsonBase.jsonToInt)
  final int price;
  @JsonKey(name: 'rolledForm', fromJson: FromJsonBase.jsonToString)
  final String? rolledForm;
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
  @JsonKey(name: 'supplier')
  final Supplier supplier;

  const ApplicationGetResponsesByApplicationIdResponse({
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
    this.rolledForm,
    this.rolledGost = '',
    this.rolledParams = '',
    this.rolledSize = '',
    this.rolledType = '',
    this.similar = false,
    this.supplier = const Supplier(),
  });

  factory ApplicationGetResponsesByApplicationIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationGetResponsesByApplicationIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationGetResponsesByApplicationIdResponseToJson(this);

  ApplicationGetResponsesByApplicationIdResponse copyWith({
    int? amount,
    String? creationDate,
    String? deliverDate,
    int? fullPrice,
    String? id,
    bool? inStock,
    String? materialBrand,
    String? materialGost,
    String? materialParams,
    int? price,
    String? rolledForm,
    String? rolledGost,
    String? rolledParams,
    String? rolledSize,
    String? rolledType,
    bool? similar,
    Supplier? supplier,
  }) {
    return ApplicationGetResponsesByApplicationIdResponse(
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
      supplier: supplier ?? this.supplier,
    );
  }
}

@JsonSerializable()
class Supplier {
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

  const Supplier({
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

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);
  Map<String, dynamic> toJson() => _$SupplierToJson(this);

  Supplier copyWith({
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
    return Supplier(
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
