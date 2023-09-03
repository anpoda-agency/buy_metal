import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_refresh_token_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_response.dart';
import 'package:buy_metal_app/data/network/api/application_api.dart';
import 'package:buy_metal_app/data/network/api/application_response_api.dart';
import 'package:buy_metal_app/data/network/api/auth_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<AuthUploadLoginResponse> authUploadLogin(
      {required AuthUploadLoginRequest request}) async {
    try {
      final response = await authApi.authUploadLogin(request: request);
      return AuthUploadLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthUploadRefreshTokenResponse> authUploadRefreshToken(
      {required String path}) async {
    try {
      final response = await authApi.authUploadRefreshToken(path: path);
      return AuthUploadRefreshTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthUploadRegisterNewUserResponse> authUploadRegisterNewUser(
      {required AuthUploadRegisterNewUserRequest request}) async {
    try {
      final response =
          await authApi.authUploadRegisterNewUser(request: request);
      return AuthUploadRegisterNewUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
