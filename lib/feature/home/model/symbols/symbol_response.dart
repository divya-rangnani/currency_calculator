import 'package:currency_calculator/feature/home/model/symbols/symbols.dart';


class SymbolResponse {
  SymbolResponse({this.success, this.symbols,this.mappedSymbols, this.errorMessage});

  SymbolResponse.fromJson(dynamic json) {
    success = json['success'];
    symbols =
        json['symbols'] != null ? Symbols.fromJson(json['symbols']) : null;
    mappedSymbols = json['symbols'] != null ? symbols?.toJson() : null;
  }

  bool? success;
  Symbols? symbols;
  Map<String, dynamic>? mappedSymbols;
  String? errorMessage;

  SymbolResponse.withError(String errorMsg)
      : errorMessage =
            errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (symbols != null) {
      map['symbols'] = symbols?.toJson();
    }
    return map;
  }
}
