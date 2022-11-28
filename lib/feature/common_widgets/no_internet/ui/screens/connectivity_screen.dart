import 'package:currency_calculator/feature/common_widgets/no_internet/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityScreen extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onRetry;
  final bool showSnackBar;
  final bool resizeToAvoidBottomInset;
  final bool automaticRetry;

  const ConnectivityScreen({
    Key? key,
    this.child,
    this.onRetry,
    this.showSnackBar = false,
    this.resizeToAvoidBottomInset = true,
    this.automaticRetry = true,
  }) : super(key: key);

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {

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
          //return widget with offline mode indication
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
          //return widget directly if has internet
          return Center(child: widget.child ?? const SizedBox());
        }
      });
  }
}
