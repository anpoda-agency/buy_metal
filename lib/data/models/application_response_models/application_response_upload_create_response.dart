// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_response_upload_create_response.g.dart';

@JsonSerializable()
class ApplicationResponseUploadCreateResponse {
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

  const ApplicationResponseUploadCreateResponse({
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

  factory ApplicationResponseUploadCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationResponseUploadCreateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationResponseUploadCreateResponseToJson(this);

  ApplicationResponseUploadCreateResponse copyWith({
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
    return ApplicationResponseUploadCreateResponse(
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
