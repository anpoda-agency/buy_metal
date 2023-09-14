// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_upload_search_response.g.dart';

@JsonSerializable()
class ApplicationUploadSearchResponse {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToInt)
  final int amount;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'customer')
  final Customer customer;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
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

  const ApplicationUploadSearchResponse({
    this.amount = 0,
    this.creationDate = '',
    this.customer = const Customer(),
    this.id = '',
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

  factory ApplicationUploadSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUploadSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationUploadSearchResponseToJson(this);

  ApplicationUploadSearchResponse copyWith({
    int? amount,
    String? creationDate,
    Customer? customer,
    String? id,
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
    return ApplicationUploadSearchResponse(
      amount: amount ?? this.amount,
      creationDate: creationDate ?? this.creationDate,
      customer: customer ?? this.customer,
      id: id ?? this.id,
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
  final String? id;
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
