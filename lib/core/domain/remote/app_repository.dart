

import 'package:currency_calculator/feature/home/model/rates/latest_response.dart';
import 'package:currency_calculator/feature/home/model/symbols/symbol_response.dart';

abstract class AppRepository {
  Future<SymbolResponse> getSymbols();

  Future<LatestResponse> getRates({String? base,List<String>? symbols});
}
