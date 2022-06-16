// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'gender_cubit.dart';

abstract class GenderState {
  bool male;
  bool female;
  GenderState({
    required this.male,
    required this.female
  });
}

class GenderInitialState extends GenderState {
  GenderInitialState({required super.male , 
  required super.female
  });
}

class GenderChangedState extends GenderState {
  GenderChangedState({required super.male, 
  required super.female
  });
}
