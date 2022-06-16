import 'package:bmi/Blocs/gendercubit/gender_cubit.dart';
import 'package:bmi/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Blocs/agecubit/age_cubit.dart';
import 'Blocs/bmi_calculate_cubit/calculate_bmi_cubit.dart';
import 'Blocs/heightcubit/height_cubit.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'BMI calculator',
      color: Colors.white,
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (BuildContext context) => HeightCubit()),
        BlocProvider(create: (BuildContext context) => AgeCubit()),
        BlocProvider(create: (BuildContext context) => GenderCubit()),
        BlocProvider(create: (BuildContext context) => CalculateBmiCubit()),
      ], 
      child: const MainPage()),
    ),
  );
}
