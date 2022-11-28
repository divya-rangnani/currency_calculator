import 'package:currency_calculator/consts/app_const.dart';
import 'package:currency_calculator/core/domain/remote/app_repository.dart';
import 'package:currency_calculator/core/services/base_dio_client.dart';
import 'package:currency_calculator/core/services/dio_client.dart';
import 'package:currency_calculator/feature/home/model/rates/latest_response.dart';
import 'package:currency_calculator/feature/home/model/symbols/symbol_response.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiRepository extends AppRepository {
  final BaseDioClient _dioClient = DioClient(AppConst.baseUrl, null, [
    LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: true,
        requestBody: true),
    DioCacheManager(
      CacheConfig(
        baseUrl: AppConst.baseUrl,
      ),
    ).interceptor
  ]);

  @override
  Future<SymbolResponse> getSymbols() async {
    final headers = {"apikey": AppConst.apiKey};
    final response = await _dioClient.dioInstance!.get(AppConst.getSymbols,
        options: buildCacheOptions(const Duration(days: 3),
            options: Options(
              headers: headers,
            )));
    if (response.statusCode == 200) {
      return SymbolResponse.fromJson(response.data);
    } else {
      return SymbolResponse.withError(response.statusMessage ??
          'Something went wrong, please try again later.');
    }
  }

  @override
  Future<LatestResponse> getRates({String? base, List<String>? symbols}) async {
    final headers = {
      "apikey": AppConst.apiKey,
    };
    var url = '${AppConst.latest}?base=$base';
    if(symbols!=null){
      url = '$url&symbols=${symbols.first},${symbols.last}';
    }
    final response = await _dioClient.dioInstance!.get(
        url,
        options: buildCacheOptions(const Duration(days: 3),
            options: Options(
              headers: headers,
            )));
    if (response.statusCode == 200) {
      return LatestResponse.fromJson(response.data);
    } else {
      return LatestResponse.withError(response.statusMessage ??
          'Something went wrong, please try again later.');
    }
  }
}
