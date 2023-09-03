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

class DealApi {
  final DioClient dioClient;

  DealApi({required this.dioClient});

  Future<Response> dealUploadCreateDeal(
      {required DealUploadCreateDealRequest request}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadCreateDealUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealGetFindDealById({required String path}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.dealGetFindDealByIdUrl + path,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealUploadUpdateOrderStatus(
      {required DealUploadUpdateOrderStatusRequest request,
      required String path}) async {
    // request body empty
    const String endUrl = "/status";
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadUpdateOrderStatusUrl + path + endUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealUploadSearch(
      {required DealUploadSearchRequest request}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadSearchUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
