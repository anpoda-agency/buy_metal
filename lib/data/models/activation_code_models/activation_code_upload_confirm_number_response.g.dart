// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activation_code_upload_confirm_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivationCodeUploadConfirmNumberResponse
    _$ActivationCodeUploadConfirmNumberResponseFromJson(
            Map<String, dynamic> json) =>
        ActivationCodeUploadConfirmNumberResponse(
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

Map<String, dynamic> _$ActivationCodeUploadConfirmNumberResponseToJson(
        ActivationCodeUploadConfirmNumberResponse instance) =>
    <String, dynamic>{
      'step': instance.step,
      'message': instance.message,
      'success': instance.success,
    };
