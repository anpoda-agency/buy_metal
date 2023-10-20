// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'user_get_user_payments_response.g.dart';

@JsonSerializable()
class UserGetUserPaymentsResponse {
  @JsonKey(name: 'amount', fromJson: FromJsonBase.jsonToDouble)
  final double amount;
  @JsonKey(name: 'customerId', fromJson: FromJsonBase.jsonToString)
  final String customerId;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'paymentDueDate', fromJson: FromJsonBase.jsonToString)
  final String paymentDueDate;
  @JsonKey(name: 'relatedOrderId', fromJson: FromJsonBase.jsonToString)
  final String relatedOrderId;
  @JsonKey(name: 'status', fromJson: FromJsonBase.jsonToString)
  final String status;

  const UserGetUserPaymentsResponse({
    this.amount = 0,
    this.customerId = '',
    this.id = '',
    this.paymentDueDate = '',
    this.relatedOrderId = '',
    this.status = '',
  });

  factory UserGetUserPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserGetUserPaymentsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserGetUserPaymentsResponseToJson(this);

  UserGetUserPaymentsResponse copyWith({
    double? amount,
    String? customerId,
    String? id,
    String? paymentDueDate,
    String? relatedOrderId,
    String? status,
  }) {
    return UserGetUserPaymentsResponse(
      amount: amount ?? this.amount,
      customerId: customerId ?? this.customerId,
      id: id ?? this.id,
      paymentDueDate: paymentDueDate ?? this.paymentDueDate,
      relatedOrderId: relatedOrderId ?? this.relatedOrderId,
      status: status ?? this.status,
    );
  }
}
