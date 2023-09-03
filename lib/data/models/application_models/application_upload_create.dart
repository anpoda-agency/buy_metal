// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'auth_register_request.g.dart';

@JsonSerializable()
class AuthRegisterRequest {
  @JsonKey(name: 'birthDate', fromJson: FromJsonBase.jsonToString)
  final String birthDate;
  @JsonKey(name: 'cityId', fromJson: FromJsonBase.jsonToString)
  final String cityId;
  @JsonKey(name: 'cityName', fromJson: FromJsonBase.jsonToString)
  final String cityName;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'firstName', fromJson: FromJsonBase.jsonToString)
  final String firstName;
  @JsonKey(name: 'lastName', fromJson: FromJsonBase.jsonToString)
  final String? lastName;
  @JsonKey(name: 'password', fromJson: FromJsonBase.jsonToString)
  final String password;
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'secondName', fromJson: FromJsonBase.jsonToString)
  final String secondName;

  const AuthRegisterRequest({
    this.birthDate = '',
    this.cityId = '',
    this.cityName = '',
    this.email = '',
    this.firstName = '',
    this.lastName,
    this.password = '',
    this.phoneNumber = '',
    this.secondName = '',
  });

  factory AuthRegisterRequest.fromJson(Map<String, dynamic> json) => _$AuthRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRegisterRequestToJson(this);

  AuthRegisterRequest copyWith({
    String? birthDate,
    String? cityId,
    String? cityName,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? phoneNumber,
    String? secondName,
  }) {
    return AuthRegisterRequest(
      birthDate: birthDate ?? this.birthDate,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      secondName: secondName ?? this.secondName,
    );
  }
}

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith