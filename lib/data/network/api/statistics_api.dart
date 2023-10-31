import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class StatisticsApi {
  final DioClient dioClient;

  StatisticsApi({required this.dioClient});

  // Добавить апи метод на получение статистики!!!

  /* Future<Response> applicationGetResponsesByApplicationId({required String path, String? accessToken}) async {
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
      rethrow;ß
    }
  } */

  Future<Response> statisticsGetStatistics({required Map<String, dynamic> queryParams, String? accessToken}) async {
    // request body empty
    //const String endUrl = "/responses";
    try {
      final Response response = await dioClient.get(
        AppConstants.statisticsGetStatisticsUrl,
        accessToken: accessToken,
        queryParameters: queryParams,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
