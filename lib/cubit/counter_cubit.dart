import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants/enum.dart';
import 'package:flutter_app/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //Each cubit or bloc have a stream of states that we can subscribe to
  //and we will subscribe to it in our counter cubit
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  CounterCubit({@required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
