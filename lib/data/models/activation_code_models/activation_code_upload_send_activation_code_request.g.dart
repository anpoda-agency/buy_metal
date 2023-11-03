// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activation_code_upload_send_activation_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivationCodeUploadSendActivationCodeRequest
    _$ActivationCodeUploadSendActivationCodeRequestFromJson(
            Map<String, dynamic> json) =>
        ActivationCodeUploadSendActivationCodeRequest(
          source: json['source'] == null
              ? ''
              : FromJsonBase.jsonToString(json['source']),
          verificationStep: json['verificationStep'] == null
              ? ''
              : FromJsonBase.jsonToString(json['verificationStep']),
          verificationType: json['verificationType'] == null
              ? ''
              : FromJsonBase.jsonToString(json['verificationType']),
        );

Map<String, dynamic> _$ActivationCodeUploadSendActivationCodeRequestToJson(
        ActivationCodeUploadSendActivationCodeRequest instance) =>
    <String, dynamic>{
      'source': instance.source,
      'verificationStep': instance.verificationStep,
      'verificationType': instance.verificationType,
    };
