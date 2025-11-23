import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_event.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<TodoBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state.todos.isEmpty){
            return Center(child: Text('No Todos added'),);
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final data = state.todos[index];
              return ListTile(
                title: Text(
                  data.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      data.createdAt.toString(),
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(RemoveTodoEvent(index));
                  },
                  icon: Icon(Icons.delete,color: Colors.red,),
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
