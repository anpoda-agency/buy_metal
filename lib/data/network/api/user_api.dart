import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

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
