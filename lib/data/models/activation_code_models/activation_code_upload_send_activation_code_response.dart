import 'package:buy_metal_app/data/models/from_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activation_code_upload_send_activation_code_response.g.dart';

@JsonSerializable()
class ActivationCodeUploadSendActivationCodeResponse {
  @JsonKey(name: 'step', fromJson: FromJsonBase.jsonToString)
  final String step;
  @JsonKey(name: 'message', fromJson: FromJsonBase.jsonToString)
  final String message;
  @JsonKey(name: 'success', fromJson: FromJsonBase.jsonToBool)
  final bool success;

  const ActivationCodeUploadSendActivationCodeResponse({
    this.step = '',
    this.message = '',
    this.success = false,
  });

  factory ActivationCodeUploadSendActivationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivationCodeUploadSendActivationCodeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationCodeUploadSendActivationCodeResponseToJson(this);

  ActivationCodeUploadSendActivationCodeResponse copyWith({
    String? step,
    String? message,
    bool? success,
  }) {
    return ActivationCodeUploadSendActivationCodeResponse(
      step: step ?? this.step,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }
}
