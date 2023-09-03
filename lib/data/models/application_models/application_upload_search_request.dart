// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'application_upload_search_request.g.dart';

@JsonSerializable()
class ApplicationUploadSearchRequest {
  @JsonKey(name: 'statuses', fromJson: FromJsonBase.jsonToListString)
  final List<String> statuses;

  const ApplicationUploadSearchRequest({
    this.statuses = const <String>[],
  });

  factory ApplicationUploadSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUploadSearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationUploadSearchRequestToJson(this);

  ApplicationUploadSearchRequest copyWith({
    List<String>? statuses,
  }) {
    return ApplicationUploadSearchRequest(
      statuses: statuses ?? this.statuses,
    );
  }
}

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith