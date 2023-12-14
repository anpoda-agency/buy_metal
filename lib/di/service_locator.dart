import 'dart:async';
import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart' as aulr;

import 'package:buy_metal_app/data/models/auth_models/auth_upload_refresh_token_response.dart';
import 'package:buy_metal_app/data/models/user_models/user_upload_find_user_by_id_response.dart';
import 'package:buy_metal_app/data/network/api/activation_code_api.dart';
import 'package:buy_metal_app/data/network/api/application_api.dart';
import 'package:buy_metal_app/data/network/api/application_response_api.dart';
import 'package:buy_metal_app/data/network/api/auth_api.dart';
import 'package:buy_metal_app/data/network/api/deal_api.dart';
import 'package:buy_metal_app/data/network/api/statistics_api.dart';
import 'package:buy_metal_app/data/network/api/user_api.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/data/storage/pref_storage.dart';
import 'package:buy_metal_app/domain/repository/activation_code_repository.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/statistics_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

//void setup() {
Future<bool> setup(StreamController<GlobalEvents> gs) async {
  await PrefStorageInstance.load();

  final storage = PrefStorage();
  getIt.registerSingleton<PrefStorage>(storage);

  getIt.registerSingleton<Dio>(Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)));

  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  //var authRepo =
  var authRepo = getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  //var userRepo =
  getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>()));

  getIt.registerSingleton(ApplicationApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ApplicationRepository(applicationApi: getIt.get<ApplicationApi>()));

  getIt.registerSingleton(ApplicationResponseApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ApplicationResponseRepository(applicationResponseApi: getIt.get<ApplicationResponseApi>()));

  getIt.registerSingleton(DealApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(DealRepository(dealApi: getIt.get<DealApi>()));

  getIt.registerSingleton(StatisticsApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(StatisticsRepository(statisticsApi: getIt.get<StatisticsApi>()));

  getIt.registerSingleton(ActivationCodeApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ActivationCodeRepository(activationCodeApi: getIt.get<ActivationCodeApi>()));

  //var authRepo = getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));
  //var userRepo = getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>()));

  String? token = await storage.getRecord(PrefName.refreshToken);
  String? userId = await storage.getRecord(PrefName.userId);

  if (token != null && token.isNotEmpty && userId != null && userId.isNotEmpty) {
    try {
      AuthUploadRefreshTokenResponse resTokens = await getIt
          .registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()))
          .authUploadRefreshToken(path: token);
      UserUploadFindUserByIdResponse userModel = await getIt
          .registerSingleton(UserRepository(userApi: getIt.get<UserApi>()))
          .userUploadFindUserById(path: userId, accessToken: resTokens.accessToken);
      await getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>())).setUserData(
          user: aulr.AuthUploadLoginResponse(
            accessToken: resTokens.accessToken,
            refreshToken: resTokens.refreshToken,
            user: aulr.User(
              blocked: userModel.blocked,
              companyAddress: userModel.companyAddress,
              companyName: userModel.companyName,
              email: userModel.email,
              fullName: userModel.fullName,
              id: userModel.id,
              mailConfirmed: userModel.mailConfirmed,
              phone: userModel.phone,
              phoneConfirmed: userModel.phoneConfirmed,
              position: userModel.position,
              registrationDate: userModel.registrationDate,
              tin: userModel.tin,
            ),
          ),
          token: resTokens.refreshToken);
      getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>())).changeAuthStatus(val: true);
    } catch (e) {
      getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>())).clearUserData();
      getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>())).changeAuthStatus(val: false);
    }
  }

  getIt<Dio>().interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
    if (error.response?.statusCode == 401) {
      if (error.response!.data.toString().isEmpty) {
        String? token = await storage.getRecord(PrefName.refreshToken);
        String? userId = await storage.getRecord(PrefName.userId);
        if (token != null && token.isNotEmpty && userId != null && userId.isNotEmpty) {
          AuthUploadRefreshTokenResponse? resTokens = await getIt
              .registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()))
              .authUploadRefreshToken(path: token);
          aulr.User userModel = getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>())).user!.user;
          await getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>())).setUserData(
              user: aulr.AuthUploadLoginResponse(
                accessToken: resTokens.accessToken,
                refreshToken: resTokens.refreshToken,
                user: aulr.User(
                  blocked: userModel.blocked,
                  companyAddress: userModel.companyAddress,
                  companyName: userModel.companyName,
                  email: userModel.email,
                  fullName: userModel.fullName,
                  id: userModel.id,
                  mailConfirmed: userModel.mailConfirmed,
                  phone: userModel.phone,
                  phoneConfirmed: userModel.phoneConfirmed,
                  position: userModel.position,
                  registrationDate: userModel.registrationDate,
                  tin: userModel.tin,
                ),
              ),
              token: resTokens.refreshToken);

          RequestOptions options = error.requestOptions;
          options.headers['Authorization'] = 'Bearer ${resTokens.accessToken}';
          handler.resolve(await _retry(options));
        }
      } else if (error.response?.data['message'] == 'Refresh tokens not same') {
        getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>())).clearUserData();
        getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>())).changeAuthStatus(val: false);
        gs.add(GlobalEvents.toStart);
      }
    }
  }));

  return authRepo.isAuth;
}

Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return getIt<Dio>().request<dynamic>(requestOptions.path,
      data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
}
