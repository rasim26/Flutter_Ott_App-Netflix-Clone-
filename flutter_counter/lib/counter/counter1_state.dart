part of 'counter1_bloc.dart';

// counter state aan use cheyyendath.
abstract class Counter1State {
  get count => null;
}

class Counter1new extends Counter1State {
  @override
  final int count;
  Counter1new({required this.count});
}

class InitialState extends Counter1new {
  InitialState() : super(count: 0);
}
