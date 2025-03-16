import 'package:dio/dio.dart';
import 'package:ncs/features/auth/data/auth_api.dart';
import 'package:ncs/features/auth/data/auth_repository.dart';

Dio dio = Dio(
  BaseOptions(
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ),
)
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print("REQUEST [${options.method}] => PATH: ${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("RESPONSE [${response.statusCode}] => DATA: ${response.data}");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print("ERROR [${e.response?.statusCode}] => MESSAGE: ${e.message}");
        return handler.next(e);
      },
    ),
  );

final authApi = AuthApi(dio);
final authRepository = AuthRepository(authApi: authApi);