// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'auth_upload_login_request.g.dart';

@JsonSerializable()
class AuthUploadLoginRequest {
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'password', fromJson: FromJsonBase.jsonToString)
  final String password;
  @JsonKey(name: 'phone', fromJson: FromJsonBase.jsonToString)
  final String phone;

  const AuthUploadLoginRequest({
    this.email = '',
    this.password = '',
    this.phone = '',
  });

  factory AuthUploadLoginRequest.fromJson(Map<String, dynamic> json) => _$AuthUploadLoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUploadLoginRequestToJson(this);

  AuthUploadLoginRequest copyWith({
    String? email,
    String? password,
    String? phone,
  }) {
    return AuthUploadLoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
