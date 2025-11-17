import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubit/todo_cubit.dart';
import 'package:flutter_bloc_tutorial/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final todo = state[index];
              return ListTile(
                title: Text(todo.name, style: TextStyle(fontSize: 18)),
                subtitle: Text(
                  todo.createdAt.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
