import 'package:buy_metal_app/data/models/from_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activation_code_upload_send_activation_code_request.g.dart';

@JsonSerializable()
class ActivationCodeUploadSendActivationCodeRequest {
  @JsonKey(name: 'source', fromJson: FromJsonBase.jsonToString)
  final String source;
  @JsonKey(name: 'verificationStep', fromJson: FromJsonBase.jsonToString)
  final String verificationStep;
  @JsonKey(name: 'verificationType', fromJson: FromJsonBase.jsonToString)
  final String verificationType;

  const ActivationCodeUploadSendActivationCodeRequest({
    this.source = '',
    this.verificationStep = '',
    this.verificationType = '',
  });

  factory ActivationCodeUploadSendActivationCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivationCodeUploadSendActivationCodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationCodeUploadSendActivationCodeRequestToJson(this);

  ActivationCodeUploadSendActivationCodeRequest copyWith({
    String? source,
    String? verificationStep,
    String? verificationType,
  }) {
    return ActivationCodeUploadSendActivationCodeRequest(
      source: source ?? this.source,
      verificationStep: verificationStep ?? this.verificationStep,
      verificationType: verificationType ?? this.verificationType,
    );
  }
}
