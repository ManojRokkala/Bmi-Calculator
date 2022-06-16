import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitialState(age: 30));

  void ageIncrement() {
    if (state.age < 90) {
      emit(AgeChangedState(age: (state.age + 1)));
    }
  }

  void ageDecrement() {
    if (state.age > 0) {
      emit(AgeChangedState(age: (state.age - 1)));
    }
  }
}
