import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_request.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_refresh_token_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_request.dart';
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
