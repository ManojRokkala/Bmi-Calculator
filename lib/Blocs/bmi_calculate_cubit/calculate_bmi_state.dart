// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculate_bmi_cubit.dart';

abstract class CalculateBmiState {
  double bmi;
  String comment;
  String status;

  CalculateBmiState({
    required this.bmi,
    required this.comment,
    required this.status,
  });
}

class CalculateBmiInitialState extends CalculateBmiState {
  CalculateBmiInitialState(
      {required super.bmi, required super.comment, required super.status});
}

class CalculateBmiChangedState extends CalculateBmiState {
  CalculateBmiChangedState(
      {required super.bmi, required super.comment, required super.status});
}

class BmiErrorState extends CalculateBmiState {
  BmiErrorState(
      {required super.bmi, required super.comment, required super.status});
}
