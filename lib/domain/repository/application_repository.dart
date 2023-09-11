import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/network/api/application_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class ApplicationRepository {
  final ApplicationApi applicationApi;

  ApplicationRepository({required this.applicationApi});

  ApplicationGetCustomerApplicationsResponse? _application;
  ApplicationGetCustomerApplicationsResponse? get application {
    return _application;
  }

  Future<ApplicationUploadCreateApplicationResponse> applicationUploadCreateApplication(
      {required ApplicationUploadCreateApplicationRequest request, String? accessToken}) async {
    try {
      final response =
          await applicationApi.applicationUploadCreateApplication(request: request, accessToken: accessToken);
      return ApplicationUploadCreateApplicationResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<ApplicationGetResponsesByApplicationIdResponse> applicationGetResponsesByApplicationId(
      {required String path}) async {
    try {
      final response = await applicationApi.applicationGetResponsesByApplicationId(path: path);
      return ApplicationGetResponsesByApplicationIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<ApplicationGetCustomerApplicationsResponse> applicationGetCustomerApplications({required String path}) async {
    try {
      final response = await applicationApi.applicationGetCustomerApplications(path: path);
      return ApplicationGetCustomerApplicationsResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<ApplicationUploadSearchResponse> applicationUploadSearch(
      {required ApplicationUploadSearchRequest request}) async {
    try {
      final response = await applicationApi.applicationUploadSearch(request: request);
      return ApplicationUploadSearchResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
