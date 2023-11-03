// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activation_code_upload_confirm_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivationCodeUploadConfirmNumberRequest
    _$ActivationCodeUploadConfirmNumberRequestFromJson(
            Map<String, dynamic> json) =>
        ActivationCodeUploadConfirmNumberRequest(
          code: json['code'] == null
              ? ''
              : FromJsonBase.jsonToString(json['code']),
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

Map<String, dynamic> _$ActivationCodeUploadConfirmNumberRequestToJson(
        ActivationCodeUploadConfirmNumberRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'source': instance.source,
      'verificationStep': instance.verificationStep,
      'verificationType': instance.verificationType,
    };
