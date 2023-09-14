import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/data/network/api/application_api.dart';
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

  Future<ApplicationResponseGetSupplierResponsesResponse> applicationResponseGetSupplierResponses(
      {required String path}) async {
    try {
      final response = await applicationResponseApi.applicationResponseGetSupplierResponses(path: path);
      return ApplicationResponseGetSupplierResponsesResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
