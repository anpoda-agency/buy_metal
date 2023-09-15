import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/user_models/user_update_user_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> userUpdateUser(
      {required UserUpdateUserRequest request, required String path, String? accessToken}) async {
    var body = request.toJson();
    body.removeWhere((key, value) => value == null);
    try {
      final Response response = await dioClient.patch(
        AppConstants.userUpdateUserUrl + path,
        body: body,
        //request.toJson(),
        accessToken: accessToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userUploadBlockUser({required String path}) async {
    // request body empty
    const String endUrl = "/block";

    try {
      final Response response = await dioClient.post(
        AppConstants.userUploadBlockUserUrl + path + endUrl,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userGetUserPayments({required String path}) async {
    // request body empty
    const String endUrl = "/payments";
    try {
      final Response response = await dioClient.get(
        AppConstants.userGetUserPaymentsUrl + path + endUrl,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
