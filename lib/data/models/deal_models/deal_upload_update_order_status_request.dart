// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'deal_upload_update_order_status_request.g.dart';

@JsonSerializable()
class DealUploadUpdateOrderStatusRequest {
  @JsonKey(name: 'initiatorId', fromJson: FromJsonBase.jsonToString)
  final String initiatorId;
  @JsonKey(name: 'targetStatus', fromJson: FromJsonBase.jsonToString)
  final String targetStatus;

  const DealUploadUpdateOrderStatusRequest({
    this.initiatorId = '',
    this.targetStatus = '',
  });

  factory DealUploadUpdateOrderStatusRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DealUploadUpdateOrderStatusRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DealUploadUpdateOrderStatusRequestToJson(this);

  DealUploadUpdateOrderStatusRequest copyWith({
    String? initiatorId,
    String? targetStatus,
  }) {
    return DealUploadUpdateOrderStatusRequest(
      initiatorId: initiatorId ?? this.initiatorId,
      targetStatus: targetStatus ?? this.targetStatus,
    );
  }
}
