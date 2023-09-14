import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class ApplicationResponseApi {
  final DioClient dioClient;

  ApplicationResponseApi({required this.dioClient});

  Future<Response> applicationResponseUploadCreate(
      {required ApplicationResponseUploadCreateRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.applicationResponseUploadCreateUrl,
        accessToken: accessToken,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> applicationResponseGetSupplierResponses({required String path, String? accessToken}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response =
          await dioClient.get(AppConstants.applicationResponseGetSupplierResponsesUrl + path, accessToken: accessToken
              //body: request.toJson(),
              );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
