import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class DealApi {
  final DioClient dioClient;

  DealApi({required this.dioClient});

  Future<Response> dealUploadCreateDeal({required DealUploadCreateDealRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadCreateDealUrl,
        body: request.toJson(),
        accessToken: accessToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealGetFindDealById({required String path, String? accessToken}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.dealGetFindDealByIdUrl + path,
        accessToken: accessToken,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealUploadUpdateOrderStatus(
      {required DealUploadUpdateOrderStatusRequest request, required String path, String? accessToken}) async {
    // request body empty
    const String endUrl = "/status";
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadUpdateOrderStatusUrl + path + endUrl,
        body: request.toJson(),
        accessToken: accessToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> dealUploadSearch({required DealUploadSearchRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.dealUploadSearchUrl,
        body: request.toJson(),
        accessToken: accessToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
