import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/add_todo_page.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/home_page.dart';
import 'package:flutter_bloc_tutorial/pallete.dart';

import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const HomePage(),
        initialRoute: '/',
        routes: {'/add-todo': (context) => AddTodoPage()},
      ),
    );
  }
}
