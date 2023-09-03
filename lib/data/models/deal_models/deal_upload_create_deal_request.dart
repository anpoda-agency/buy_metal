// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'deal_upload_create_deal_request.g.dart';

@JsonSerializable()
class DealUploadCreateDealRequest {
  @JsonKey(name: 'applicationId', fromJson: FromJsonBase.jsonToString)
  final String applicationId;
  @JsonKey(name: 'applicationResponseId', fromJson: FromJsonBase.jsonToString)
  final String applicationResponseId;

  const DealUploadCreateDealRequest({
    this.applicationId = '',
    this.applicationResponseId = '',
  });

  factory DealUploadCreateDealRequest.fromJson(Map<String, dynamic> json) =>
      _$DealUploadCreateDealRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DealUploadCreateDealRequestToJson(this);

  DealUploadCreateDealRequest copyWith({
    String? applicationId,
    String? applicationResponseId,
  }) {
    return DealUploadCreateDealRequest(
      applicationId: applicationId ?? this.applicationId,
      applicationResponseId:
          applicationResponseId ?? this.applicationResponseId,
    );
  }
}
