import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_event.dart';
import 'package:flutter_bloc_tutorial/cubit/todo_cubit.dart';
import 'package:flutter_bloc_tutorial/models/todo_model.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

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
              decoration: InputDecoration(hintText: 'Enter your todos title'),
            ),
            TextFormField(
              controller: _descriptionTEController,
              decoration: InputDecoration(
                hintText: 'Enter your todos description',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final todo = Todo(
                  title: _textEditingController.text.trim(),
                  subTitle: _descriptionTEController.text.trim(),
                  createdAt: DateTime.now(),
                );
                context.read<TodoBloc>().add(AddTodoEvent(todo));
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
