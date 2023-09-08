import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/server_response.dart';
import 'package:buy_metal_app/data/models/user_models/user_get_user_payments_response.dart';
import 'package:buy_metal_app/data/network/api/application_api.dart';
import 'package:buy_metal_app/data/network/api/application_response_api.dart';
import 'package:buy_metal_app/data/network/api/user_api.dart';
import 'package:buy_metal_app/data/network/dio_exception.dart';
import 'package:buy_metal_app/data/storage/pref_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class UserRepository extends ChangeNotifier {
  final UserApi userApi;

  UserRepository({required this.userApi});

  AuthUploadLoginResponse? _user;
  AuthUploadLoginResponse? get user => _user;

  // Попов сказал разберется с респонсом
/* 
  Future<ServerResponse> userUploadBlockUser({required String path}) async {
    try {
      final response = await userApi.userUploadBlockUser(path: path);
      return ServerResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  */

  Future<void> setUserData({required AuthUploadLoginResponse user, String? token}) async {
    _user = user;
    if (token != null) {
      await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, token);
      await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, user.user.id);
    }
    notifyListeners();
  }

  Future<void> clearUserData() async {
    _user = null;
    await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, '');
    await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, '');
    notifyListeners();
  }

  Future<UserGetUserPaymentsResponse> userGetUserPayments({required String path}) async {
    try {
      final response = await userApi.userGetUserPayments(path: path);
      return UserGetUserPaymentsResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
