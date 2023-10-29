import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class StatisticsApi {
  final DioClient dioClient;

  StatisticsApi({required this.dioClient});

  // Добавить апи метод на получение статистики!!!

  Future<Response> applicationGetResponsesByApplicationId({required String path, String? accessToken}) async {
    // request body empty
    const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.applicationGetResponsesByApplicationIdUrl + path + endUrl,
        accessToken: accessToken,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> applicationGetCustomerApplications({required String path, String? accessToken}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.applicationGetCustomerApplicationsdUrl + path,
        accessToken: accessToken,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}