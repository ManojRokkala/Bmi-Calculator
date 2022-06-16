import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitialState(male: false, female: false));

  void maleSelected() {
    state.male = true;
    state.female = false;
    emit(GenderChangedState(male: state.male, female: state.female));
  }

  void femaleSelected() {
    state.male = false;
    state.female = true;
    emit(GenderChangedState(male: state.male, female: state.female));
  }
}
