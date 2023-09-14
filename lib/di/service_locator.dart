import 'package:buy_metal_app/data/network/api/application_api.dart';
import 'package:buy_metal_app/data/network/api/application_response_api.dart';
import 'package:buy_metal_app/data/network/api/auth_api.dart';
import 'package:buy_metal_app/data/network/api/user_api.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
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
  getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>()));

  getIt.registerSingleton(ApplicationApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ApplicationRepository(applicationApi: getIt.get<ApplicationApi>()));

  getIt.registerSingleton(ApplicationResponseApi(dioClient: getIt.get<DioClient>()));
  getIt.registerSingleton(ApplicationResponseRepository(applicationResponseApi: getIt.get<ApplicationResponseApi>()));
}
