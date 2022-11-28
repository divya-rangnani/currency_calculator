import 'package:currency_calculator/core/services/base_dio_client.dart';
import 'package:dio/dio.dart';

class DioClient extends BaseDioClient {
  DioClient(
    String? baseUrl,
    Dio? dioInstance,
    List<Interceptor>? interceptors,
  ) : super(
          baseUrl: baseUrl,
          dio: dioInstance,
          interceptors: interceptors,
        );
}
