part of 'network_bloc.dart';

abstract class NetworkEvent {}

class ListenConnection extends NetworkEvent {}

class ConnectionChanged extends NetworkEvent {
  NetworkState connection;
  ConnectionChanged(this.connection);
}

class FetchNetworkStatus extends NetworkEvent{}

class ShowSnackbarEvent extends NetworkEvent{
  bool showSnackbar;
  ShowSnackbarEvent(this.showSnackbar);
}