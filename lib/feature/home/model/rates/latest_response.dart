import 'package:currency_calculator/feature/home/model/rates/rates.dart';

class LatestResponse {
  LatestResponse({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
    this.mappedRates,
    this.errorMessage,
  });

  LatestResponse.fromJson(dynamic json) {
    success = json['success'];
    timestamp = json['timestamp'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
    mappedRates = json['rates'] != null ? rates?.toJson() : null;
  }

  bool? success;
  int? timestamp;
  String? base;
  String? date;
  Rates? rates;
  String? errorMessage;
  Map<String, dynamic>? mappedRates;

  LatestResponse.withError(String errorMsg)
      : errorMessage =
      errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['timestamp'] = timestamp;
    map['base'] = base;
    map['date'] = date;
    if (rates != null) {
      map['rates'] = rates?.toJson();
    }
    return map;
  }
}
