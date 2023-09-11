// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';
import 'package:buy_metal_app/features/1.7/ui/create_order_page.dart';

part 'application_upload_create_application_request.g.dart';

@JsonSerializable()
class ApplicationUploadCreateApplicationRequest {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToInt)
  final int amount;
  @JsonKey(name: 'creationDate', fromJson: FromJsonBase.jsonToString)
  final String creationDate;
  @JsonKey(name: 'materialBrand', fromJson: FromJsonBase.jsonToString)
  final String materialBrand;
  @JsonKey(name: 'materialGost', fromJson: FromJsonBase.jsonToString)
  final String materialGost;
  @JsonKey(name: 'materialParams', fromJson: FromJsonBase.jsonToString)
  final String materialParams;
  @JsonKey(name: 'rolledForm')
  final TypeListEnum? rolledForm;
  @JsonKey(name: 'rolledGost', fromJson: FromJsonBase.jsonToString)
  final String rolledGost;
  @JsonKey(name: 'rolledParams', fromJson: FromJsonBase.jsonToString)
  final String rolledParams;
  @JsonKey(name: 'rolledSize', fromJson: FromJsonBase.jsonToString)
  final String rolledSize;
  @JsonKey(name: 'rolledType', fromJson: FromJsonBase.jsonToString)
  final String rolledType;
  @JsonKey(name: 'userId', fromJson: FromJsonBase.jsonToString)
  final String userId;

  const ApplicationUploadCreateApplicationRequest({
    this.amount = 0,
    this.creationDate = '',
    this.materialBrand = '',
    this.materialGost = '',
    this.materialParams = '',
    this.rolledForm,
    this.rolledGost = '',
    this.rolledParams = '',
    this.rolledSize = '',
    this.rolledType = '',
    this.userId = '',
  });

  factory ApplicationUploadCreateApplicationRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUploadCreateApplicationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationUploadCreateApplicationRequestToJson(this);

  ApplicationUploadCreateApplicationRequest copyWith({
    int? amount,
    String? creationDate,
    String? materialBrand,
    String? materialGost,
    String? materialParams,
    TypeListEnum? rolledForm,
    String? rolledGost,
    String? rolledParams,
    String? rolledSize,
    String? rolledType,
    String? userId,
  }) {
    return ApplicationUploadCreateApplicationRequest(
      amount: amount ?? this.amount,
      creationDate: creationDate ?? this.creationDate,
      materialBrand: materialBrand ?? this.materialBrand,
      materialGost: materialGost ?? this.materialGost,
      materialParams: materialParams ?? this.materialParams,
      rolledForm: rolledForm ?? this.rolledForm,
      rolledGost: rolledGost ?? this.rolledGost,
      rolledParams: rolledParams ?? this.rolledParams,
      rolledSize: rolledSize ?? this.rolledSize,
      rolledType: rolledType ?? this.rolledType,
      userId: userId ?? this.userId,
    );
  }
}

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith