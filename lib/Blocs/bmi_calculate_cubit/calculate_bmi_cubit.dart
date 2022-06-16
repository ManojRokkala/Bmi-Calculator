import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculate_bmi_state.dart';

class CalculateBmiCubit extends Cubit<CalculateBmiState> {
  CalculateBmiCubit()
      : super(CalculateBmiInitialState(bmi: 0, status: '', comment: ''));

  String gender = '';
  int height = 10;
  int weight = 10;
  int age = 10;

  void saveData({
    required String gender,
    required int height,
    required int weight,
    required int age,
  }) {
    this.gender = gender;
    this.height = height;
    this.age = age;
    this.weight = weight;

    double bmi = ((weight / ((height / 100) * (height / 100))));
    if (bmi < 18) {
      String comment =
          "This indicates that you are underweight, \nso you may need to put on some weight. \nYou are recommended to ask your doctor or a dietitian for advice.";
      String conditon = 'Severely underweight';
      emit(CalculateBmiChangedState(
          bmi: bmi, comment: comment, status: conditon));
    } else if (bmi > 18 && bmi < 25) {
      String comment =
          'Indicates that you are at a healthy weight for your height. \nBy maintaining a healthy weight, \nyou lower your risk of developing serious health problems.';
      String conditon = 'Normal';
      emit(CalculateBmiChangedState(
          bmi: bmi, comment: comment, status: conditon));
    } else if (bmi > 25 && bmi < 30) {
      String comment =
          ' Indicates that you are slightly overweight. \nYou may be advised to lose some weight for health reasons. \nYou are recommended to talk to your doctor or a dietitian for advice.';
      String conditon = 'Overweight';
      emit(CalculateBmiChangedState(
          bmi: bmi, comment: comment, status: conditon));
    } else if (bmi > 30 && bmi < 35) {
      String comment =
          'Indicates that you are heavily overweight.\nYour health may be at risk if you do not lose weight.\nYou are recommended to talk to your doctor or a dietitian for advice.';
      String conditon = 'Obese';
      emit(CalculateBmiChangedState(
          bmi: bmi, comment: comment, status: conditon));
    } else if (bmi > 35 && bmi < 40) {
      String comment =
          'Indicates that you are heavily overweight.\nYour health may be at risk if you do not lose weight.\nYou are recommended to talk to your doctor or a dietitian for advice.';
      String conditon = 'SevereObese';
      emit(CalculateBmiChangedState(
          bmi: bmi, comment: comment, status: conditon));
    } else if (bmi > 40 || gender.isEmpty || weight.toString().isEmpty) {
      String? comment='';
      String? status='';
      emit(BmiErrorState(bmi: bmi, comment: comment, status: status));
    }
  }
}
