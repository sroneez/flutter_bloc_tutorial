import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/counter_event.dart';
import 'package:flutter_bloc_tutorial/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.counterValue + 1));
    });

    on<DecrementEvent>((event, emit) {
      if (state.counterValue > 0) {
        emit(CounterState(state.counterValue - 1));
      }
    });
  }
}
