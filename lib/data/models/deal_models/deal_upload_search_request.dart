// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'deal_upload_search_request.g.dart';

@JsonSerializable()
class DealUploadSearchRequest {
  @JsonKey(name: 'customerId', fromJson: FromJsonBase.jsonToString)
  final String customerId;
  @JsonKey(name: 'limit', fromJson: FromJsonBase.jsonToInt)
  final int limit;
  @JsonKey(name: 'offset', fromJson: FromJsonBase.jsonToInt)
  final int offset;
  @JsonKey(name: 'statuses', fromJson: FromJsonBase.jsonToListString)
  final List<String> statuses;
  @JsonKey(name: 'supplierId', fromJson: FromJsonBase.jsonToString)
  final String supplierId;

  const DealUploadSearchRequest({
    this.customerId = '',
    this.limit = 0,
    this.offset = 0,
    this.statuses = const <String>[],
    this.supplierId = '',
  });

  factory DealUploadSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$DealUploadSearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DealUploadSearchRequestToJson(this);

  DealUploadSearchRequest copyWith({
    String? customerId,
    int? limit,
    int? offset,
    List<String>? statuses,
    String? supplierId,
  }) {
    return DealUploadSearchRequest(
      customerId: customerId ?? this.customerId,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      statuses: statuses ?? this.statuses,
      supplierId: supplierId ?? this.supplierId,
    );
  }
}
