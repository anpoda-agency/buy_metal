// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_response_upload_create_request.g.dart';

@JsonSerializable()
class ApplicationResponseUploadCreateRequest {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToInt)
  final int amount;
  @JsonKey(name: 'applicationId', fromJson: FromJsonBase.jsonToString)
  final String applicationId;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'deliverDate', fromJson: FromJsonBase.jsonToString)
  final String deliverDate;
  @JsonKey(name: 'fullPrice', fromJson: FromJsonBase.jsonToInt)
  final int fullPrice;
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
  @JsonKey(name: 'userID', fromJson: FromJsonBase.jsonToString)
  final String userID;

  const ApplicationResponseUploadCreateRequest({
    this.amount = 0,
    this.applicationId = '',
    this.creationDate = '',
    this.deliverDate = '',
    this.fullPrice = 0,
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
    this.userID = '',
  });

  factory ApplicationResponseUploadCreateRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ApplicationResponseUploadCreateRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ApplicationResponseUploadCreateRequestToJson(this);

  ApplicationResponseUploadCreateRequest copyWith({
    int? amount,
    String? applicationId,
    String? creationDate,
    String? deliverDate,
    int? fullPrice,
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
    String? userID,
  }) {
    return ApplicationResponseUploadCreateRequest(
      amount: amount ?? this.amount,
      applicationId: applicationId ?? this.applicationId,
      creationDate: creationDate ?? this.creationDate,
      deliverDate: deliverDate ?? this.deliverDate,
      fullPrice: fullPrice ?? this.fullPrice,
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
      userID: userID ?? this.userID,
    );
  }
}
