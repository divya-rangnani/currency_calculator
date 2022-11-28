import 'package:currency_calculator/core/domain/remote/api_repository.dart';
import 'package:currency_calculator/feature/home/model/rates/latest_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'operation_state.dart';

class OperationCubit extends Cubit<OperationState> {
  final ApiRepository _apiRepository = ApiRepository();

  OperationCubit() : super(OperationInitial());

  Future<void> getRate({String? base}) async {
    emit(OperationLoading());
    LatestResponse latestResponse = await _apiRepository.getRates(base: base);
    if (latestResponse.mappedRates != null) {
      emit(RatesLoaded(mappedRates: latestResponse.mappedRates));
    } else {
      emit(const OperationError(
          'Something went wrong, please try again in sometime!'));
    }
  }

  Future<void> getRateWithOperation({
    required String base,
    required double input1,
    required String currencyOfInput1,
    required double input2,
    required String currencyOfInput2,
    required OPERATION operation,
  }) async {
    OperationState currentState = state;
    emit(OperationLoading());
    num? input1CurrencyRate;
    num? input2CurrencyRate;
    num? exchangeRateOfInput1;
    num? exchangeRateOfInput2;

    if (currentState is RatesLoaded &&
        currentState.base == base &&
        currentState.currencyOfInput1 == currencyOfInput1 &&
        currentState.currencyOfInput2 == currencyOfInput2) {
      exchangeRateOfInput1 = currentState.exchangeRateOfInput1;
      exchangeRateOfInput2 = currentState.exchangeRateOfInput2;
    } else if (currentState is RatesLoaded &&
        currentState.mappedRates != null) {
      exchangeRateOfInput1 = currentState.mappedRates?.entries
          .firstWhere((element) => element.key == currencyOfInput1)
          .value;
      exchangeRateOfInput2 = currentState.mappedRates?.entries
          .firstWhere((element) => element.key == currencyOfInput2)
          .value;
    } else {
      LatestResponse latestResponse = await _apiRepository
          .getRates(base: base, symbols: [currencyOfInput1, currencyOfInput2]);
      if (latestResponse.mappedRates != null) {
        exchangeRateOfInput1 = latestResponse.mappedRates?.entries
            .firstWhere((element) => element.key == currencyOfInput1)
            .value;
        exchangeRateOfInput2 = latestResponse.mappedRates?.entries
            .firstWhere((element) => element.key == currencyOfInput2)
            .value;
      }
    }
    if (exchangeRateOfInput1 != null && exchangeRateOfInput2 != null) {
      input1CurrencyRate = input1 / exchangeRateOfInput1;
      input2CurrencyRate = input2 / exchangeRateOfInput2;
      String? result;
      String? strOperation;
      if (operation == OPERATION.addition) {
        result = (input1CurrencyRate.toDouble() + input2CurrencyRate.toDouble())
            .toStringAsFixed(2);
        strOperation = '$currencyOfInput1 $input1 + $currencyOfInput2 $input2';
      } else if (operation == OPERATION.subtraction) {
        result = (input1CurrencyRate.toDouble() - input2CurrencyRate.toDouble())
            .toStringAsFixed(2);
        strOperation = '$currencyOfInput1 $input1 - $currencyOfInput2 $input2';
      } else if (operation == OPERATION.division) {
        result = (input1CurrencyRate.toDouble() / input2CurrencyRate.toDouble())
            .toStringAsFixed(2);
        strOperation = '$currencyOfInput1 $input1 ÷ $currencyOfInput2 $input2';
      } else if (operation == OPERATION.multiply) {
        result = (input1CurrencyRate.toDouble() * input2CurrencyRate.toDouble())
            .toStringAsFixed(2);
        strOperation = '$currencyOfInput1 $input1 * $currencyOfInput2 $input2';
      }
      if (currentState is RatesLoaded) {
        emit(currentState.copyWith(
            base: base,
            currencyOfInput1: currencyOfInput1,
            currencyOfInput2: currencyOfInput2,
            exchangeRateOfInput1: exchangeRateOfInput1,
            exchangeRateOfInput2: exchangeRateOfInput2,
            result: result,
            operation: operation,
            strOperation: strOperation));
      } else {
        emit(RatesLoaded(
            base: base,
            currencyOfInput1: currencyOfInput1,
            currencyOfInput2: currencyOfInput2,
            exchangeRateOfInput1: exchangeRateOfInput1,
            exchangeRateOfInput2: exchangeRateOfInput2,
            result: result,
            operation: operation,
            strOperation: strOperation));
      }
    }
  }

  void resetOperationStates() {
    OperationState currentState = state;
    if (currentState is RatesLoaded) {
      emit(OperationLoading());
     emit(RatesLoaded(
         mappedRates: currentState.mappedRates,
         base: null,
         currencyOfInput1: null,
         currencyOfInput2: null,
         exchangeRateOfInput1: null,
         exchangeRateOfInput2: null,
         result: null,
         operation: null,
         strOperation: null));
    }else{
      emit(OperationInitial());
    }

  }
}

enum OPERATION { addition, subtraction, division, multiply }
