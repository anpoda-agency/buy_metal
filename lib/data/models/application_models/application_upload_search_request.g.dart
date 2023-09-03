// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_upload_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationUploadSearchRequest _$ApplicationUploadSearchRequestFromJson(
        Map<String, dynamic> json) =>
    ApplicationUploadSearchRequest(
      statuses: json['statuses'] == null
          ? const <String>[]
          : FromJsonBase.jsonToListString(json['statuses']),
    );

Map<String, dynamic> _$ApplicationUploadSearchRequestToJson(
        ApplicationUploadSearchRequest instance) =>
    <String, dynamic>{
      'statuses': instance.statuses,
    };
