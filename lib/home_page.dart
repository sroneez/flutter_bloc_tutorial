import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/counter_event.dart';

import 'bloc/counter_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(state.counterValue.toString());
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              counterBloc.add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              counterBloc.add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
