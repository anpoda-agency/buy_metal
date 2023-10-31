// ...
import 'package:buy_metal_app/data/models/statistics_models/statistics_get_statistics_response.dart';
import 'package:buy_metal_app/data/network/api/statistics_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StatisticsRepository extends ChangeNotifier {
  final StatisticsApi statisticsApi;

  StatisticsRepository({required this.statisticsApi});

  /* ApplicationGetCustomerApplicationsResponse? _customerApplication;
  //const ApplicationGetCustomerApplicationsResponse(); // Попов сказал потом покажет как правильно переписать
  ApplicationGetCustomerApplicationsResponse? get customerApplication {
    return _customerApplication;
  }

  Future<void> setApplicationData({required ApplicationGetCustomerApplicationsResponse customerApplication}) async {
    _customerApplication = customerApplication;
    /* if (token != null) {
      await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, token);
      await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, user.user.id);
    } */
    notifyListeners();
  } */

  Future<StatisticsGetStatisticsResponse> statisticsGetStatistics(
      {required Map<String, dynamic> queryParams, String? accessToken}) async {
    try {
      final response = await statisticsApi.statisticsGetStatistics(queryParams: queryParams, accessToken: accessToken);
      return StatisticsGetStatisticsResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /* Future<List<ApplicationGetResponsesByApplicationIdResponse>> applicationGetResponsesByApplicationId(
      {required String path, String? accessToken}) async {
    try {
      final response =
          await applicationApi.applicationGetResponsesByApplicationId(path: path, accessToken: accessToken);
      if (response.data is List<dynamic>) {
        List<ApplicationGetResponsesByApplicationIdResponse> list = [];
        for (dynamic item in response.data as List<dynamic>) {
          list.add(ApplicationGetResponsesByApplicationIdResponse.fromJson(item as Map<String, dynamic>));
        }
        return list;
      }
      return [];
      //return ApplicationGetResponsesByApplicationIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  } */
}
