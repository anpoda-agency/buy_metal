// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'auth_upload_register_new_user_request.g.dart';

@JsonSerializable()
class AuthUploadRegisterNewUserRequest {
  @JsonKey(name: 'companyAddress', fromJson: FromJsonBase.jsonToString)
  final String companyAddress;
  @JsonKey(name: 'companyName', fromJson: FromJsonBase.jsonToString)
  final String companyName;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'fullName', fromJson: FromJsonBase.jsonToString)
  final String fullName;
  @JsonKey(name: 'password', fromJson: FromJsonBase.jsonToString)
  final String password;
  @JsonKey(name: 'phone', fromJson: FromJsonBase.jsonToString)
  final String phone;
  @JsonKey(name: 'position', fromJson: FromJsonBase.jsonToString)
  final String position;
  @JsonKey(name: 'tin', fromJson: FromJsonBase.jsonToString)
  final String tin;

  const AuthUploadRegisterNewUserRequest({
    this.companyAddress = '',
    this.companyName = '',
    this.email = '',
    this.fullName = '',
    this.password = '',
    this.phone = '',
    this.position = '',
    this.tin = '',
  });

  factory AuthUploadRegisterNewUserRequest.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUploadRegisterNewUserRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AuthUploadRegisterNewUserRequestToJson(this);

  AuthUploadRegisterNewUserRequest copyWith({
    String? companyAddress,
    String? companyName,
    String? email,
    String? fullName,
    String? password,
    String? phone,
    String? position,
    String? tin,
  }) {
    return AuthUploadRegisterNewUserRequest(
      companyAddress: companyAddress ?? this.companyAddress,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      position: position ?? this.position,
      tin: tin ?? this.tin,
    );
  }
}
