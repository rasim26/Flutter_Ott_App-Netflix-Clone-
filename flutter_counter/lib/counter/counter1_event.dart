part of 'counter1_bloc.dart';

@immutable
sealed class Counter1Event {}

class Increment extends Counter1Event {

}

class Decrement extends Counter1Event {
  
}
