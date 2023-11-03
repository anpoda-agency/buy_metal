import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_confirm_number_request.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_confirm_number_response.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_send_activation_code_request.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_send_activation_code_response.dart';
import 'package:buy_metal_app/data/network/api/activation_code_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ActivationCodeRepository extends ChangeNotifier {
  final ActivationCodeApi activationCodeApi;

  ActivationCodeRepository({required this.activationCodeApi});

  /* ApplicationGetCustomerApplicationsResponse? _customerApplication;
  //const ApplicationGetCustomerApplicationsResponse(); // Попов сказал потом покажет как правильно переписать
  ApplicationGetCustomerApplicationsResponse? get customerApplication {
    return _customerApplication;
  } */

  /* Future<void> setApplicationData({required ApplicationGetCustomerApplicationsResponse customerApplication}) async {
    _customerApplication = customerApplication;
    /* if (token != null) {
      await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, token);
      await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, user.user.id);
    } */
    notifyListeners();
  } */

  Future<ActivationCodeUploadSendActivationCodeResponse> activationCodeUploadSendActivationCode(
      {required ActivationCodeUploadSendActivationCodeRequest request, String? accessToken}) async {
    try {
      final response =
          await activationCodeApi.activationCodeUploadSendActivationCode(request: request, accessToken: accessToken);
      return ActivationCodeUploadSendActivationCodeResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<ActivationCodeUploadConfirmNumberResponse> activationCodeUploadConfirmNumber(
      {required ActivationCodeUploadConfirmNumberRequest request, String? accessToken}) async {
    try {
      final response =
          await activationCodeApi.activationCodeUploadConfirmNumber(request: request, accessToken: accessToken);
      return ActivationCodeUploadConfirmNumberResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
