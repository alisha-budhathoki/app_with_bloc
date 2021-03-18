import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/counter_cubit.dart';
import 'package:flutter_app/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

