import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/counter_cubit.dart';
import 'package:flutter_app/cubit/internet_cubit.dart';
import 'package:flutter_app/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({@required this.connectivity});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: context.read<InternetCubit>(),
          ),
        )
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
