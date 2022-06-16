
part of 'age_cubit.dart';

abstract class AgeState {
  int age;
  AgeState({
    required this.age,
  });
}

class AgeInitialState extends AgeState {
  AgeInitialState({required super.age});
}

class AgeChangedState extends AgeState {
  AgeChangedState({required super.age});
}
