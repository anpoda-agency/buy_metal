import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<Response> authUploadLogin({required AuthUploadLoginRequest request}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.authUploadLoginUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> authUploadRefreshToken({required String path}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.post(
        AppConstants.authUploadRefreshTokenUrl + path,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> authUploadRegisterNewUser({required AuthUploadRegisterNewUserRequest request}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.authUploadRegisterNewUserUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
