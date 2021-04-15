import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(), child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = context.read<CounterCubit>();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textStateCubit(counterCubit),
            SizedBox(height: 50),
            button(counterCubit),
          ],
        ),
      ),
    );
  }

  Widget textStateCubit(CounterCubit counterCubit) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      String text = '';

      if (state is CounterInitial) {
        text = 'Estado inicial';
      } else if (state is CounterSecond) {
        text = 'Segundo estado';
      } else if (state is CounterThird) {
        text = 'Terceiro estado';
      } else {
        text = 'Outro estado';
      }

      return Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${counterCubit.counter}",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 80,
            ),
          ),
        ],
      );
    });
  }

  Widget button(CounterCubit counterCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            counterCubit.incrementCounter();
          },
          child: Text('ADICIONAR'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.red,
          ),
          onPressed: () {
            counterCubit.resetCouting();
          },
          child: Text('RESETAR'),
        ),
      ],
    );
  }
}
