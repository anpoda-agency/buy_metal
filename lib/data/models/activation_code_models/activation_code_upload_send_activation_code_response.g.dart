// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activation_code_upload_send_activation_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivationCodeUploadSendActivationCodeResponse
    _$ActivationCodeUploadSendActivationCodeResponseFromJson(
            Map<String, dynamic> json) =>
        ActivationCodeUploadSendActivationCodeResponse(
          step: json['step'] == null
              ? ''
              : FromJsonBase.jsonToString(json['step']),
          message: json['message'] == null
              ? ''
              : FromJsonBase.jsonToString(json['message']),
          success: json['success'] == null
              ? false
              : FromJsonBase.jsonToBool(json['success']),
        );

Map<String, dynamic> _$ActivationCodeUploadSendActivationCodeResponseToJson(
        ActivationCodeUploadSendActivationCodeResponse instance) =>
    <String, dynamic>{
      'step': instance.step,
      'message': instance.message,
      'success': instance.success,
    };
