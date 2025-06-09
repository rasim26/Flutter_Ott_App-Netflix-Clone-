import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter1_event.dart';
part 'counter1_state.dart';

// bloc il aan ella karyangalum kidakkunnath.
// on enna oru function athinu vendi use cheyyanam.
class Counter1Bloc extends Bloc<Counter1Event, Counter1State> {
  Counter1Bloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      final currentStateValue = state.count;
      final incrementedValue = currentStateValue + 1;
      return emit(Counter1new(count: incrementedValue));
    });

    on<Decrement>((event, emit) {
      final currentStateValue = state.count;
      final decrementedValue = currentStateValue - 1;
      return emit(Counter1new(count: decrementedValue));
    });
  }
}
