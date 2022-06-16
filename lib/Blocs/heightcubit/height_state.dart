part of 'height_cubit.dart';

abstract class HeightState {
  int height;
  HeightState({
    required this.height,
  });
}

class HeightInitialState extends HeightState {
  HeightInitialState({required super.height});
}

class HeightChangedState extends HeightState {
  HeightChangedState({required super.height});
}
