import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_refresh_token_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_response.dart';
import 'package:buy_metal_app/data/network/api/auth_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class AuthRepository extends ChangeNotifier {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  void changeAuthStatus({bool? val}) {
    if (val != null) {
      _isAuth = val;
    } else {
      _isAuth = !_isAuth;
    }
    notifyListeners();
  }

  Future<AuthUploadLoginResponse> authUploadLogin({required AuthUploadLoginRequest request}) async {
    try {
      final response = await authApi.authUploadLogin(request: request);
      return AuthUploadLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthUploadRefreshTokenResponse> authUploadRefreshToken({required String path}) async {
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
      final response = await authApi.authUploadRegisterNewUser(request: request);
      return AuthUploadRegisterNewUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
