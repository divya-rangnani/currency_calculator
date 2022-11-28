import 'package:currency_calculator/consts/app_const.dart';
import 'package:currency_calculator/feature/common_widgets/common_button.dart';
import 'package:currency_calculator/feature/common_widgets/common_drop_down.dart';
import 'package:currency_calculator/feature/common_widgets/common_text_form_feild_view.dart';
import 'package:currency_calculator/feature/home/bloc/operation/operation_cubit.dart';
import 'package:currency_calculator/feature/home/bloc/symbol/symbol_cubit.dart';
import 'package:currency_calculator/feature/home/ui/common_widget/common_error_widget.dart';
import 'package:currency_calculator/feature/home/ui/common_widget/operation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String result = "--";
  String? strOperation;

  @override
  void dispose() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text(
                AppConst.appTitle,
              ),
            ),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(gradient: linearGradient),
                child: BlocBuilder<SymbolCubit, SymbolState>(
                    builder: (context, symbolState) {
                  if (symbolState is SymbolInitial) {
                    BlocProvider.of<SymbolCubit>(context).getSymbolData();
                  } else if (symbolState is SymbolLoaded) {
                    //getting rates of selected currency
                    context
                        .read<OperationCubit>()
                        .getRate(base: symbolState.selectedValue!);

                    return SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: BlocBuilder<OperationCubit, OperationState>(
                              builder: (context, operationState) {
                            if (operationState is OperationInitial ||
                                (operationState is RatesLoaded &&
                                    operationState.mappedRates == null)) {
                              context
                                  .read<OperationCubit>()
                                  .getRate(base: symbolState.selectedValue!);
                            }
                            if (operationState is RatesLoaded) {
                              result = operationState.result ?? "--";
                              strOperation = operationState.strOperation;
                            }
                            return Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                        'Output Currency',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    CommonDropDown(
                                      value: symbolState.selectedValue ??
                                          symbolState
                                              .symbols?.entries.first.key,
                                      hintText: 'Select a Symbol',
                                      items: symbolState.symbols?.entries
                                          .map<DropdownMenuItem<String>>(
                                            (value) => DropdownMenuItem<String>(
                                              value: value.key,
                                              child: Text(value.key),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (String? value) {
                                        if (value != null) {
                                          //changing output currency
                                          context
                                              .read<SymbolCubit>()
                                              .selectOutputSymbol(value);
                                          //changing state of inputs
                                          context
                                              .read<OperationCubit>()
                                              .resetOperationStates();
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    CommonTextFormField(
                                      controller: textEditingController1,
                                      hintText: 'Enter Number',
                                      title: 'Text Input 1',
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(8),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r"[0-9.]")),
                                      ],
                                      suffixIcon: CommonDropDown(
                                        isSuffix: true,
                                        value: symbolState.selectedValue1 ??
                                            symbolState
                                                .symbols?.entries.first.key,
                                        hintText: 'Select a Symbol',
                                        items: symbolState.symbols?.entries
                                            .map<DropdownMenuItem<String>>(
                                              (value) =>
                                                  DropdownMenuItem<String>(
                                                value: value.key,
                                                child: Text(value.key),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            //updating value of input1
                                            context
                                                .read<SymbolCubit>()
                                                .selectInput1Symbol(value);
                                            //changing state of inputs because result may vary
                                            context
                                                .read<OperationCubit>()
                                                .resetOperationStates();
                                          }
                                        },
                                      ),
                                      validator: (val) {
                                        if (val == null ||
                                            val.toString().isEmpty) {
                                          return "Please enter Text Input 1";
                                        }
                                      },
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                    ),
                                    CommonTextFormField(
                                      controller: textEditingController2,
                                      hintText: 'Enter Number',
                                      title: 'Text Input 2',
                                      inputFormatters: [
                                        //allowing user to enter numbers only (up to 8 digits)
                                        LengthLimitingTextInputFormatter(8),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r"[0-9.]")),
                                      ],
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: (val) {
                                        if (val == null ||
                                            val.toString().isEmpty) {
                                          return "Please enter Text Input 2";
                                        }
                                      },
                                      suffixIcon: CommonDropDown(
                                        isSuffix: true,
                                        value: symbolState.selectedValue2 ??
                                            symbolState
                                                .symbols?.entries.first.key,
                                        hintText: 'Select a Symbol',
                                        items: symbolState.symbols?.entries
                                            .map<DropdownMenuItem<String>>(
                                              (value) =>
                                                  DropdownMenuItem<String>(
                                                value: value.key,
                                                child: Text(value.key),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            //updating value of input2
                                            context
                                                .read<SymbolCubit>()
                                                .selectInput2Symbol(value);
                                            //changing state of inputs because result may vary
                                            context
                                                .read<OperationCubit>()
                                                .resetOperationStates();
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          //adding horizontal scroll because UI may cause issue for smaller devices
                                          // also, we can add as many operations as it can be accessed by scrolling
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                OperationWidget(
                                                  operation: OPERATION.addition,
                                                  onTap: () {
                                                    manageClick(
                                                        OPERATION.addition,
                                                        symbolState);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 12.0,
                                                ),
                                                OperationWidget(
                                                  operation:
                                                      OPERATION.subtraction,
                                                  onTap: () {
                                                    manageClick(
                                                        OPERATION.subtraction,
                                                        symbolState);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 12.0,
                                                ),
                                                OperationWidget(
                                                  operation: OPERATION.multiply,
                                                  onTap: () {
                                                    manageClick(
                                                        OPERATION.multiply,
                                                        symbolState);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 12.0,
                                                ),
                                                OperationWidget(
                                                  operation: OPERATION.division,
                                                  onTap: () {
                                                    manageClick(
                                                        OPERATION.division,
                                                        symbolState);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          operationState is OperationLoading
                                              ? const CircularProgressIndicator(
                                                  color: Colors.blue)
                                              : operationState
                                                      is OperationLoading
                                                  ? const CommonErrorWidget(
                                                      errorMsg:
                                                          'Error while performing Operation',
                                                    )
                                                  : result == "--"
                                                      ? const SizedBox()
                                                      : RichText(
                                                          text: TextSpan(
                                                            text:
                                                                "Result ${strOperation != null ? "of $strOperation" : ""} is \n",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    "${symbolState.selectedValue!} $result",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        height:
                                                                            1.5),
                                                              )
                                                            ],
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                          CommonButton(
                                            title: 'Reset',
                                            linearGradient: linearGradient,
                                            onTap: onReset,
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            );
                          })),
                    );
                  } else if (symbolState is SymbolError) {
                    return const CommonErrorWidget();
                  }
                  return const CircularProgressIndicator(color: Colors.blue);
                }),
              ),
            )));
  }

  var linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue,
      Colors.blue.withOpacity(0.5),
      Colors.blue.withOpacity(0.3),
    ],
  );

  manageClick(OPERATION operation, SymbolLoaded symbolState) {
    switch (operation) {
      case OPERATION.addition:
        performAddition(symbolState);
        break;
      case OPERATION.subtraction:
        performSubtraction(symbolState);
        break;
      case OPERATION.multiply:
        performMultiply(symbolState);
        break;
      case OPERATION.division:
        performDivision(symbolState);
        break;
    }
  }

  void performAddition(SymbolLoaded symbolState) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OperationCubit>(context).getRateWithOperation(
        operation: OPERATION.addition,
        input1: double.parse(textEditingController1.text),
        input2: double.parse(textEditingController2.text),
        currencyOfInput1: symbolState.selectedValue1!,
        currencyOfInput2: symbolState.selectedValue2!,
        base: symbolState.selectedValue!,
      );
    }
  }

  void performSubtraction(SymbolLoaded symbolState) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OperationCubit>(context).getRateWithOperation(
        operation: OPERATION.subtraction,
        input1: double.parse(textEditingController1.text),
        input2: double.parse(textEditingController2.text),
        currencyOfInput1: symbolState.selectedValue1!,
        currencyOfInput2: symbolState.selectedValue2!,
        base: symbolState.selectedValue!,
      );
    }
  }

  void performDivision(SymbolLoaded symbolState) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OperationCubit>(context).getRateWithOperation(
        operation: OPERATION.division,
        input1: double.parse(textEditingController1.text),
        input2: double.parse(textEditingController2.text),
        currencyOfInput1: symbolState.selectedValue1!,
        currencyOfInput2: symbolState.selectedValue2!,
        base: symbolState.selectedValue!,
      );
    }
  }

  void performMultiply(SymbolLoaded symbolState) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OperationCubit>(context).getRateWithOperation(
        operation: OPERATION.multiply,
        input1: double.parse(textEditingController1.text),
        input2: double.parse(textEditingController2.text),
        currencyOfInput1: symbolState.selectedValue1!,
        currencyOfInput2: symbolState.selectedValue2!,
        base: symbolState.selectedValue!,
      );
    }
  }

  void onReset() {
    FocusManager.instance.primaryFocus?.unfocus();
    _formKey.currentState?.reset();
    textEditingController1.clear();
    textEditingController2.clear();
    BlocProvider.of<OperationCubit>(context).resetOperationStates();
  }
}
