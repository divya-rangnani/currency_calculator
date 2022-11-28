import 'package:currency_calculator/feature/common_widgets/no_internet/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetScreen extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onRetry;
  final bool showSnackBar;
  final bool resizeToAvoidBottomInset;
  final bool automaticRetry;

  const NoInternetScreen({
    Key? key,
    this.child,
    this.onRetry,
    this.showSnackBar = false,
    this.resizeToAvoidBottomInset = true,
    this.automaticRetry = true,
  }) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {

  @override
  void initState() {
    BlocProvider.of<NetworkBloc>(context).mapEventToState(ListenConnection());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NetworkBloc, NetworkState>(listener: (context, state) {
        if (state is ConnectionSuccess &&
            widget.onRetry != null &&
            widget.automaticRetry) {
          widget.onRetry!();
        }
      }, builder: (context, state) {
        if (state is ConnectionFailure) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons
                          .signal_wifi_connected_no_internet_4,
                      color: Colors.red,
                      size: 24.0,
                      semanticLabel: 'no_internet',
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "You're Offline!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(child: Center(child: widget.child ?? const SizedBox()))
            ],
          );
        } else {
          return Center(child: widget.child ?? const SizedBox());
        }
      });
  }
}
