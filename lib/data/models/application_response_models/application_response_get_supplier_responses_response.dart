// application_response_get_supplier_responses_response

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_response_get_supplier_responses_response.g.dart';

@JsonSerializable()
class ApplicationResponseGetSupplierResponsesResponse {
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

  const ApplicationResponseGetSupplierResponsesResponse({
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
  });

  factory ApplicationResponseGetSupplierResponsesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ApplicationResponseGetSupplierResponsesResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ApplicationResponseGetSupplierResponsesResponseToJson(this);

  ApplicationResponseGetSupplierResponsesResponse copyWith({
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
  }) {
    return ApplicationResponseGetSupplierResponsesResponse(
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
