// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buy_metal_app/data/models/from_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activation_code_upload_confirm_number_request.g.dart';

@JsonSerializable()
class ActivationCodeUploadConfirmNumberRequest {
  @JsonKey(name: 'code', fromJson: FromJsonBase.jsonToString)
  final String code;
  @JsonKey(name: 'source', fromJson: FromJsonBase.jsonToString)
  final String source;
  @JsonKey(name: 'verificationStep', fromJson: FromJsonBase.jsonToString)
  final String verificationStep;
  @JsonKey(name: 'verificationType', fromJson: FromJsonBase.jsonToString)
  final String verificationType;

  const ActivationCodeUploadConfirmNumberRequest({
    this.code = '',
    this.source = '',
    this.verificationStep = '',
    this.verificationType = '',
  });

  factory ActivationCodeUploadConfirmNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivationCodeUploadConfirmNumberRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationCodeUploadConfirmNumberRequestToJson(this);

  ActivationCodeUploadConfirmNumberRequest copyWith({
    String? code,
    String? source,
    String? verificationStep,
    String? verificationType,
  }) {
    return ActivationCodeUploadConfirmNumberRequest(
      code: code ?? this.code,
      source: source ?? this.source,
      verificationStep: verificationStep ?? this.verificationStep,
      verificationType: verificationType ?? this.verificationType,
    );
  }
}
