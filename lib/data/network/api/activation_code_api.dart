import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_confirm_number_request.dart';
import 'package:buy_metal_app/data/models/activation_code_models/activation_code_upload_send_activation_code_request.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';

class ActivationCodeApi {
  final DioClient dioClient;

  ActivationCodeApi({required this.dioClient});

  Future<Response> activationCodeUploadSendActivationCode(
      {required ActivationCodeUploadSendActivationCodeRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.activationCodeUploadSendActivationCodeUrl,
        accessToken: accessToken,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> activationCodeUploadConfirmNumber(
      {required ActivationCodeUploadConfirmNumberRequest request, String? accessToken}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.activationCodeUploadConfirmNumberUrl,
        accessToken: accessToken,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
