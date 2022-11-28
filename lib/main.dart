import 'package:currency_calculator/consts/app_const.dart';
import 'package:currency_calculator/core/config/navigation_service.dart';
import 'package:currency_calculator/feature/common_widgets/no_internet/bloc/network_bloc.dart';
import 'package:currency_calculator/feature/home/bloc/operation/operation_cubit.dart';
import 'package:currency_calculator/feature/home/bloc/symbol/symbol_cubit.dart';
import 'package:currency_calculator/feature/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConst.appTitle,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => NetworkBloc()..add(ListenConnection())),
          BlocProvider(create: (context) => SymbolCubit()),
          BlocProvider(create: (context) => OperationCubit()),
        ], child: const HomeScreen()));
  }
}
