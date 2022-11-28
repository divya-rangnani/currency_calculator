part of 'operation_cubit.dart';

enum OperationLoadedStatus { initial, loading, loaded, error }

abstract class OperationState extends Equatable {
  const OperationState();
}

class OperationInitial extends OperationState {
  @override
  List<Object> get props => [];
}

class OperationLoading extends OperationState {
  @override
  List<Object> get props => [];
}

class RatesLoaded extends OperationState {
  final Map<String, dynamic>? mappedRates;
  final String? base;
  final String? currencyOfInput1;
  final String? currencyOfInput2;
  final String? strOperation;
  final OPERATION? operation;
  final String? result;
  final num? exchangeRateOfInput1;
  final num? exchangeRateOfInput2;

  const RatesLoaded(
      {this.mappedRates,
      this.base,
      this.currencyOfInput1,
      this.currencyOfInput2,
      this.exchangeRateOfInput1,
      this.exchangeRateOfInput2,
      this.operation,
      this.result,
      this.strOperation});

  RatesLoaded copyWith(
      {Map<String, dynamic>? mappedRates,
      String? base,
      String? currencyOfInput1,
      String? currencyOfInput2,
      String? strOperation,
      OPERATION? operation,
      String? result,
      num? exchangeRateOfInput1,
      num? exchangeRateOfInput2}) {
    return RatesLoaded(
        mappedRates: mappedRates ?? this.mappedRates,
        base: base ?? this.base,
        currencyOfInput1: currencyOfInput1 ?? this.currencyOfInput1,
        currencyOfInput2: currencyOfInput2 ?? this.currencyOfInput2,
        exchangeRateOfInput1: exchangeRateOfInput1 ?? this.exchangeRateOfInput1,
        exchangeRateOfInput2: exchangeRateOfInput2 ?? this.exchangeRateOfInput2,
        operation: operation ?? this.operation,
        result: result ?? this.result,
        strOperation: strOperation ?? this.strOperation);
  }

  @override
  List<Object?> get props => [
        mappedRates,
        base,
        currencyOfInput1,
        currencyOfInput2,
        exchangeRateOfInput1,
        exchangeRateOfInput2,
        operation,
        result,
        strOperation
      ];
}

class OperationError extends OperationState {
  final String message;

  const OperationError(this.message);

  @override
  List<Object> get props => [message];
}
