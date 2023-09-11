import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class ApplicationApi {
  final DioClient dioClient;

  ApplicationApi({required this.dioClient});

  Future<Response> applicationUploadCreateApplication(
      {required ApplicationUploadCreateApplicationRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.applicationUploadCreateApplicationUrl,
        accessToken: accessToken,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> applicationGetResponsesByApplicationId({required String path}) async {
    // request body empty
    const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.applicationGetResponsesByApplicationIdUrl + path + endUrl,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> applicationGetCustomerApplications({required String path}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.applicationGetCustomerApplicationsdUrl + path,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> applicationUploadSearch({required ApplicationUploadSearchRequest request}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.applicationUploadSearchUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
