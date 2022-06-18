import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_event.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  //initial state required super instantiate class and initial state is provided
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  //closing because listen have been used. esko karan page close huda pani always active hunxa
  //kunai event always active rakhnu parnexa vane talako code nalekhda hunxa
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
