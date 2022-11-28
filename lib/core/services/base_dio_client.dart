import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

class BaseDioClient {
  final String? baseUrl;
  Dio? dioInstance;

  final List<Interceptor>? interceptors;

  BaseDioClient({
    this.baseUrl,
    Dio? dio,
    this.interceptors,
  }) {
    dioInstance = dio ?? Dio();
    if(interceptors!=null){
      dioInstance?.interceptors.addAll(interceptors!);
    }
    (dioInstance!.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (client) {
      HttpClient httpClient = HttpClient();

      return httpClient;
    };
  }

  String handleError(DioError dioError) {
    String errorDescription = "";
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    return errorDescription;
  }

  String handleStatusCodeError(int? statusCode) {
    String errorDescription = "Something went wrong!";
    if (statusCode != null) {
      if (statusCode >= 300 && statusCode < 400) {
        errorDescription = "API redirected";
      } else if (statusCode >= 400 && statusCode < 500) {
        errorDescription = "UnAuthorised!";
      } else if (statusCode >= 500) {
        errorDescription = "Internal Server Error!";
      }
    }
    return errorDescription;
  }
}