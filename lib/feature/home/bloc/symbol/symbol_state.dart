part of 'symbol_cubit.dart';

enum SymbolLoadedStatus { initial, loading, loaded, error }

abstract class SymbolState extends Equatable {
  const SymbolState();
}

class SymbolInitial extends SymbolState {
  @override
  List<Object> get props => [];
}

class SymbolLoading extends SymbolState {
  @override
  List<Object> get props => [];
}

class SymbolLoaded extends SymbolState {
  final Map<String, dynamic>? symbols;
  final String? selectedValue;
  final String? selectedValue1;
  final String? selectedValue2;

  const SymbolLoaded(
      {this.symbols,
      this.selectedValue,
      this.selectedValue1,
      this.selectedValue2});

  SymbolLoaded copyWith(
      {Map<String, dynamic>? symbols,
      String? selectedValue,
      String? selectedValue1,
      String? selectedValue2}) {
    return SymbolLoaded(
      symbols: symbols ?? this.symbols,
      selectedValue: selectedValue ?? this.selectedValue,
      selectedValue1: selectedValue1 ?? this.selectedValue1,
      selectedValue2: selectedValue2 ?? this.selectedValue2,
    );
  }

  @override
  List<Object?> get props =>
      [symbols, selectedValue, selectedValue1, selectedValue2];
}

class SymbolError extends SymbolState {
  final String message;

  const SymbolError(this.message);

  @override
  List<Object> get props => [message];
}
