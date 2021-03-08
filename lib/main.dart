import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/counter_cubit.dart';
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button '),
            BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
              if (state.counterValue % 2 == 0) {
                return Text('even counter value');
              } else if (state.counterValue == 5) {
                return Text("number 5");
              }
              return Text((state.counterValue < 0)
                  ? 'negative value'
                  : 'COUNTER VALUE ' + state.counterValue.toString());
            },
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Incremented"),
                      duration: Duration(milliseconds: 300),
                    ));
                  } else if (state.wasIncremented == false) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Decremented"),
                        duration: Duration(milliseconds: 300)));
                  }
                }),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: "Decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    print('Pressed main');
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: "Increment",
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ));
  }
}
