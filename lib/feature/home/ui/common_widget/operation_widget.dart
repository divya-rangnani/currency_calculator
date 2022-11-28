import 'package:currency_calculator/feature/home/bloc/operation/operation_cubit.dart';
import 'package:flutter/material.dart';

class OperationWidget extends StatelessWidget {
  final OPERATION operation;
  final VoidCallback? onTap;

  const OperationWidget({
    required this.operation,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, //manageClick(operation),
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            getSymbol(operation),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ));
  }

  String getSymbol(OPERATION operation) {
    switch (operation) {
      case OPERATION.addition:
        return "+";
      case OPERATION.subtraction:
        return "-";
      case OPERATION.multiply:
        return "*";
      case OPERATION.division:
        return "÷";
      default:
        return "--";
    }
  }
}
