import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/data/network/api/application_response_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class ApplicationResponseRepository {
  final ApplicationResponseApi applicationResponseApi;

  ApplicationResponseRepository({required this.applicationResponseApi});

  Future<ApplicationResponseUploadCreateResponse> applicationResponseUploadCreate(
      {required ApplicationResponseUploadCreateRequest request, String? accessToken}) async {
    try {
      final response =
          await applicationResponseApi.applicationResponseUploadCreate(request: request, accessToken: accessToken);
      return ApplicationResponseUploadCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<ApplicationResponseGetSupplierResponsesResponse>> applicationResponseGetSupplierResponses(
      {required String path, String? accessToken}) async {
    try {
      final response =
          await applicationResponseApi.applicationResponseGetSupplierResponses(path: path, accessToken: accessToken);
      if (response.data is List<dynamic>) {
        List<ApplicationResponseGetSupplierResponsesResponse> list = [];
        for (dynamic item in response.data as List<dynamic>) {
          list.add(ApplicationResponseGetSupplierResponsesResponse.fromJson(item as Map<String, dynamic>));
        }
        return list;
      }
      return [];
      //return ApplicationResponseGetSupplierResponsesResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
