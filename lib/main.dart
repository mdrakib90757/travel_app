import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubits_logic/app_cubits_logic.dart';
import 'package:travel_app/pages/details_pages/details_pages.dart';
import 'package:travel_app/pages/nav_pages/main_pages/main_pages.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(),
        child: AppCubitsLogic(),
      ),
      //MainPagesNavPage(),
    );
  }
}
