import 'package:buy_metal_app/data/network/api/auth_api.dart';
import 'package:buy_metal_app/data/network/dio_client.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
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
}