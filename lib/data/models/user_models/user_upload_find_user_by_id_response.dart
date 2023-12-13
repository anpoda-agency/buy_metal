// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'user_upload_find_user_by_id_response.g.dart';

@JsonSerializable()
class UserUploadFindUserByIdResponse {
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
  @JsonKey(name: 'phoneConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool phoneConfirmed;
  @JsonKey(name: 'position', fromJson: FromJsonBase.jsonToString)
  final String position;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'tin', fromJson: FromJsonBase.jsonToString)
  final String tin;

  const UserUploadFindUserByIdResponse({
    this.blocked = false,
    this.companyAddress = '',
    this.companyName = '',
    this.email = '',
    this.fullName = '',
    this.id = '',
    this.mailConfirmed = false,
    this.phone = '',
    this.phoneConfirmed = false,
    this.position = '',
    this.registrationDate = '',
    this.tin = '',
  });

  factory UserUploadFindUserByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUploadFindUserByIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserUploadFindUserByIdResponseToJson(this);

  UserUploadFindUserByIdResponse copyWith({
    bool? blocked,
    String? companyAddress,
    String? companyName,
    String? email,
    String? fullName,
    String? id,
    bool? mailConfirmed,
    String? phone,
    bool? phoneConfirmed,
    String? position,
    String? registrationDate,
    String? tin,
  }) {
    return UserUploadFindUserByIdResponse(
      blocked: blocked ?? this.blocked,
      companyAddress: companyAddress ?? this.companyAddress,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      mailConfirmed: mailConfirmed ?? this.mailConfirmed,
      phone: phone ?? this.phone,
      phoneConfirmed: phoneConfirmed ?? this.phoneConfirmed,
      position: position ?? this.position,
      registrationDate: registrationDate ?? this.registrationDate,
      tin: tin ?? this.tin,
    );
  }
}
