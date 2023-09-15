import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/data/models/user_models/user_get_user_payments_response.dart';
import 'package:buy_metal_app/data/models/user_models/user_update_user_request.dart';
import 'package:buy_metal_app/data/models/user_models/user_update_user_response.dart';
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

  // БЛЯ ХОЧУ СЕТТЕР НАПИСАТТЬ НА ИЗМЕНЕНИЕ РЕПЫ ПРЯМ СИЛЬНО ХОЧУф
  //AuthUploadLoginResponse? set userSet(AuthUploadLoginResponse user) {};

  Future<UserUpdateUserResponse> userUpdateUser(
      {required UserUpdateUserRequest request, required String path, String? accessToken}) async {
    try {
      final response = await userApi.userUpdateUser(request: request, path: path, accessToken: accessToken);
      return UserUpdateUserResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

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
