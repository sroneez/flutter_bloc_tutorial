import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: 'Enter your todos'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              context.read<TodoCubit>().addTodo(_textEditingController.text.trim());
              Navigator.of(context).pop();
            }, child: Text('Add')),
          ],
        ),
      ),

    );
  }
}
