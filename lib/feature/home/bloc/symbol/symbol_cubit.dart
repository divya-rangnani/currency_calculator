import 'package:currency_calculator/core/domain/remote/api_repository.dart';
import 'package:currency_calculator/feature/home/model/symbols/symbol_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'symbol_state.dart';

class SymbolCubit extends Cubit<SymbolState> {
  final ApiRepository _apiRepository = ApiRepository();

  SymbolCubit() : super(SymbolInitial());

  Future<void> getSymbolData() async {
    emit(SymbolLoading());
    SymbolResponse symbolResponse = await _apiRepository.getSymbols();
    if (symbolResponse.mappedSymbols != null) {
      emit(SymbolLoaded(
          symbols: symbolResponse.mappedSymbols,
          selectedValue: symbolResponse.mappedSymbols?.keys.first,
          selectedValue1: symbolResponse.mappedSymbols?.keys.first,
          selectedValue2: symbolResponse.mappedSymbols?.keys.first));
    } else {
      emit(SymbolError(
          symbolResponse.errorMessage ?? 'Error while performing Operation!'));
    }
  }

  void selectOutputSymbol(String selectedValue) {
    if (state is SymbolLoaded) {
      var currState = state as SymbolLoaded;
      emit(currState.copyWith(selectedValue: selectedValue));
    }
  }

  void selectInput1Symbol(String selectedValue) {
    if (state is SymbolLoaded) {
      var currState = state as SymbolLoaded;
      emit(currState.copyWith(selectedValue1: selectedValue));
    }
  }

  void selectInput2Symbol(String selectedValue) {
    if (state is SymbolLoaded) {
      var currState = state as SymbolLoaded;
      emit(currState.copyWith(selectedValue2: selectedValue));
    }
  }

  /*void resetSymbolStates() {
    if (state is SymbolLoaded) {
      var currState = state as SymbolLoaded;
     emit(SymbolLoaded(
       symbols: currState.symbols,
         selectedValue: currState.selectedValue,
         selectedValue1:currState.selectedValue1,
         selectedValue2: currState.selectedValue2,

     ));
   }
  }*/
}
