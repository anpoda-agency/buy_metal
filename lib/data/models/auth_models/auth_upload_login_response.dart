// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'auth_upload_login_response.g.dart';

@JsonSerializable()
class AuthUploadLoginResponse {
  @JsonKey(name: 'accessToken', fromJson: FromJsonBase.jsonToString)
  final String accessToken;
  @JsonKey(name: 'refreshToken', fromJson: FromJsonBase.jsonToString)
  final String refreshToken;
  @JsonKey(name: 'user')
  final User user;

  const AuthUploadLoginResponse({
    this.accessToken = '',
    this.refreshToken = '',
    this.user = const User(),
  });

  factory AuthUploadLoginResponse.fromJson(Map<String, dynamic> json) => _$AuthUploadLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUploadLoginResponseToJson(this);

  AuthUploadLoginResponse copyWith({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) {
    return AuthUploadLoginResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: 'blocked', fromJson: FromJsonBase.jsonToBool)
  final bool blocked;
  @JsonKey(name: 'companyAddress', fromJson: FromJsonBase.jsonToString)
  final String companyAddress;
  @JsonKey(name: 'companyName', fromJson: FromJsonBase.jsonToString)
  final String companyName;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'fullName', fromJson: FromJsonBase.jsonToString)
  final String fullName;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'mailConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool mailConfirmed;
  @JsonKey(name: 'phone', fromJson: FromJsonBase.jsonToString)
  final String phone;
  @JsonKey(name: 'position', fromJson: FromJsonBase.jsonToString)
  final String position;
  @JsonKey(name: 'refresh', fromJson: FromJsonBase.jsonToString)
  final String refresh;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'tin', fromJson: FromJsonBase.jsonToString)
  final String tin;

  const User({
    this.blocked = false,
    this.companyAddress = '',
    this.companyName = '',
    this.email = '',
    this.fullName = '',
    this.id = '',
    this.mailConfirmed = false,
    this.phone = '',
    this.position = '',
    this.refresh = '',
    this.registrationDate = '',
    this.tin = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    bool? blocked,
    String? companyAddress,
    String? companyName,
    String? email,
    String? fullName,
    String? id,
    bool? mailConfirmed,
    String? phone,
    String? position,
    String? refresh,
    String? registrationDate,
    String? tin,
  }) {
    return User(
      blocked: blocked ?? this.blocked,
      companyAddress: companyAddress ?? this.companyAddress,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      mailConfirmed: mailConfirmed ?? this.mailConfirmed,
      phone: phone ?? this.phone,
      position: position ?? this.position,
      refresh: refresh ?? this.refresh,
      registrationDate: registrationDate ?? this.registrationDate,
      tin: tin ?? this.tin,
    );
  }
}
