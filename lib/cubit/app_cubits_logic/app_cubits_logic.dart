import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states/app_cubit_states.dart';
import 'package:travel_app/pages/welcome_page.dart';

import '../app_cubit/app_cubit.dart';

class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({super.key});

  @override
  State<AppCubitsLogic> createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
