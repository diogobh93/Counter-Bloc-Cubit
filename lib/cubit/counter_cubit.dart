import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 1;

  CounterCubit() : super(CounterInitial());

  Future<void> incrementCounter() async {
    counter++;
    if (counter == 2) {
      emit(CounterSecond());
    } else if (counter == 3) {
      emit(CounterThird());
    } else {
      emit(CounterThereafter());
    }
  }

  Future<void> resetCouting() async {
    counter = 1;
    emit(CounterInitial());
  }
}
