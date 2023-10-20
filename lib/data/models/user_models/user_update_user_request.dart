// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'user_update_user_request.g.dart';

@JsonSerializable()
class UserUpdateUserRequest {
  @JsonKey(name: 'companyAddress', fromJson: FromJsonBase.jsonToString)
  final String companyAddress;
  @JsonKey(name: 'companyName', fromJson: FromJsonBase.jsonToString)
  final String companyName;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'fullName', fromJson: FromJsonBase.jsonToString)
  final String fullName;
  @JsonKey(name: 'phone', fromJson: FromJsonBase.jsonToString)
  final String phone;
  @JsonKey(name: 'tin', fromJson: FromJsonBase.jsonToString)
  final String tin;

  const UserUpdateUserRequest({
    this.companyAddress = '',
    this.companyName = '',
    this.email = '',
    this.fullName = '',
    this.phone = '',
    this.tin = '',
  });

  factory UserUpdateUserRequest.fromJson(Map<String, dynamic> json) => _$UserUpdateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateUserRequestToJson(this);

  UserUpdateUserRequest copyWith({
    String? companyAddress,
    String? companyName,
    String? email,
    String? fullName,
    String? phone,
    String? tin,
  }) {
    return UserUpdateUserRequest(
      companyAddress: companyAddress ?? this.companyAddress,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      tin: tin ?? this.tin,
    );
  }
}
