import 'package:buy_metal_app/data/models/from_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activation_code_upload_confirm_number_response.g.dart';

@JsonSerializable()
class ActivationCodeUploadConfirmNumberResponse {
  @JsonKey(name: 'step', fromJson: FromJsonBase.jsonToString)
  final String step;
  @JsonKey(name: 'message', fromJson: FromJsonBase.jsonToString)
  final String message;
  @JsonKey(name: 'success', fromJson: FromJsonBase.jsonToBool)
  final bool success;

  const ActivationCodeUploadConfirmNumberResponse({
    this.step = '',
    this.message = '',
    this.success = false,
  });
  factory ActivationCodeUploadConfirmNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivationCodeUploadConfirmNumberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationCodeUploadConfirmNumberResponseToJson(this);

  ActivationCodeUploadConfirmNumberResponse copyWith({
    String? step,
    String? message,
    bool? success,
  }) {
    return ActivationCodeUploadConfirmNumberResponse(
      step: step ?? this.step,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }
}
