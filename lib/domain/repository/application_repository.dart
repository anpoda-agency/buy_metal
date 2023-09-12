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

  ApplicationGetCustomerApplicationsResponse? _customerApplication;
  ApplicationGetCustomerApplicationsResponse? get customerApplication {
    return _customerApplication;
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

  Future<List<ApplicationGetCustomerApplicationsResponse>> applicationGetCustomerApplications(
      {required String path, String? accessToken}) async {
    try {
      final res = await applicationApi.applicationGetCustomerApplications(path: path, accessToken: accessToken);
      if (res.data is List<dynamic>) {
        List<ApplicationGetCustomerApplicationsResponse> list = [];
        for (dynamic item in res.data as List<dynamic>) {
          list.add(ApplicationGetCustomerApplicationsResponse.fromJson(item as Map<String, dynamic>));
        }
        return list;
      }
      return [];
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
