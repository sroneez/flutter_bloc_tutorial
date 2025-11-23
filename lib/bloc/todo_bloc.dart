import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_event.dart';
import 'package:flutter_bloc_tutorial/bloc/todo_state.dart';
import 'package:flutter_bloc_tutorial/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: [])) {
    on<AddTodoEvent>((event, emit) {
      final updatedTodo = List<Todo>.from(state.todos)..add(event.todo);
      emit(TodoState(todos: updatedTodo));
    });

    on<RemoveTodoEvent>((event, emit) {
      final updatedTodo = List<Todo>.from(state.todos)..removeAt(event.index);
      emit(TodoState(todos: updatedTodo));
    });
  }
}
