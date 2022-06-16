import 'package:bmi/Blocs/agecubit/age_cubit.dart';
import 'package:bmi/Blocs/bmi_calculate_cubit/calculate_bmi_cubit.dart';
import 'package:bmi/Blocs/gendercubit/gender_cubit.dart';
import 'package:bmi/Blocs/heightcubit/height_cubit.dart';
import 'package:bmi/Screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController weightController = TextEditingController();
  double heightd = 40;
  int height = 40;
  String gender = '';
  int age = 1;
  int weight = 15;

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CalculateBmiCubit, CalculateBmiState>(
        listener: (context, state) {
          if (state is CalculateBmiChangedState) {
            ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context,
                state.bmi.toStringAsFixed(1), state.status, state.comment));
          } else if (state is BmiErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(context));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  appText(context, 'BMI calculator', 22, Colors.black),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    //height: 20
                  ),
                  BlocBuilder<GenderCubit, GenderState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: genderButtons(
                              context,
                              'assets/images/male.png',
                              'Male',
                              state.male,
                            ),
                            onTap: () {
                              context.read<GenderCubit>().maleSelected();
                              gender = 'Male';
                            },
                          ),
                          GestureDetector(
                            child: genderButtons(
                              context,
                              'assets/images/female.png',
                              'Female',
                              state.female,
                            ),
                            onTap: () {
                              context.read<GenderCubit>().femaleSelected();
                              gender = 'Female';
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    //height: 18
                  ),
                  Container(
                      padding: const EdgeInsets.all(12),
                      height: 180,
                      decoration: decorationBox(context),
                      child: BlocBuilder<HeightCubit, HeightState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appText(
                                  context, 'Height (in cm)', 18, Colors.black),
                              appText(context, state.height.toString(), 20,
                                  Colors.black),
                              Slider(
                                min: 40,
                                max: 190,
                                value: heightd,
                                onChanged: (value) {
                                  heightd = value;
                                  context
                                      .read<HeightCubit>()
                                      .onHeightChanged(heightd.toInt());
                                  height = heightd.toInt();
                                },
                              ),
                            ],
                          );
                        },
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    //height: 18
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 180,
                        height: 180,
                        decoration: decorationBox(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appText(
                                context, 'Weight (in kg)', 18, Colors.black),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            TextFormField(
                              controller: weightController,
                              maxLength: 3,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                } else {
                                  int value = int.parse(weightController.text);
                                  weight = value;
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(196, 204, 199, 199),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                              ),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont('Lato',
                                  fontSize: 30,
                                  letterSpacing: 0.9,
                                  fontWeight: FontWeight.w600),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: 180,
                        height: 180,
                        decoration: decorationBox(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(context, 'Age', 18, Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(6),
                                  splashColor: Colors.grey,
                                  child: ageContainer(context, Icons.remove),
                                  onTap: () {
                                    context.read<AgeCubit>().ageDecrement();
                                  },
                                ),
                                BlocBuilder<AgeCubit, AgeState>(
                                  builder: (context, state) {
                                    age = state.age;
                                    return appText(context,
                                        state.age.toString(), 30, Colors.black);
                                  },
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(6),
                                  splashColor: Colors.grey,
                                  child: ageContainer(context, Icons.add),
                                  onTap: () {
                                    context.read<AgeCubit>().ageIncrement();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Center(
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 7, 37, 61),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: appText(context, 'BMI', 18, Colors.white),
                      ),
                      onPressed: () {
                        BlocProvider.of<CalculateBmiCubit>(context).saveData(
                            age: age,
                            height: height,
                            gender: gender,
                            weight: weight);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget genderButtons(
  BuildContext context,
  String image,
  String title,
  bool selected,
) {
  return Container(
    width: 180,
    height: 180,
    decoration: BoxDecoration(
      border: Border.all(
          color: selected
              ? Colors.black
              : const Color.fromARGB(255, 182, 178, 178),
          width: 2),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: 70,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: GoogleFonts.getFont('Lato',
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1),
          ),
        ],
      ),
    ),
  );
}

