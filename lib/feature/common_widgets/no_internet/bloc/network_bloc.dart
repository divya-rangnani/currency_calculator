import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_checker_service.dart';

part 'network_event.dart';

part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectionInitial());

  StreamSubscription? _subscription;

  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is ListenConnection) {
      _subscription =
          InternetConnectionCheckerService.onStatusChange.listen((status) {
        add(
          ConnectionChanged(
            status ? ConnectionSuccess() : ConnectionFailure(),
          ),
        );
      });
    } else if (event is FetchNetworkStatus) {
      var status = await InternetConnectionCheckerService.hasConnection;

      if (status) {
        yield ConnectionSuccess();
      } else {
        yield ConnectionFailure();
      }
    } else if (event is ConnectionChanged) {
      yield event.connection;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
