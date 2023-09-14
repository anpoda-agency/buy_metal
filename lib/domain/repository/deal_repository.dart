import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_response.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_response.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_response.dart';
import 'package:buy_metal_app/data/network/api/deal_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class DealRepository {
  final DealApi dealApi;

  DealRepository({required this.dealApi});

  Future<DealUploadCreateDealResponse> dealUploadCreateDeal({required DealUploadCreateDealRequest request}) async {
    try {
      final response = await dealApi.dealUploadCreateDeal(request: request);
      return DealUploadCreateDealResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<DealGetFindDealByIdResponse> dealGetFindDealById({required String path}) async {
    try {
      final response = await dealApi.dealGetFindDealById(path: path);
      return DealGetFindDealByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<DealUploadUpdateOrderStatusResponse> dealUploadUpdateOrderStatus(
      {required DealUploadUpdateOrderStatusRequest request, required String path}) async {
    try {
      final response = await dealApi.dealUploadUpdateOrderStatus(request: request, path: path);
      return DealUploadUpdateOrderStatusResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<DealUploadSearchResponse> dealUploadSearch({required DealUploadSearchRequest request}) async {
    try {
      final response = await dealApi.dealUploadSearch(request: request);
      return DealUploadSearchResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
